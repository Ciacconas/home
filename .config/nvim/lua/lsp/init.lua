local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp.lsp-installer")
require("lsp.null-ls")



local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)

local custom_attach = function(client)
	local filetype = vim.api.nvim_buf_get_option(0, "filetype")

	--   if nvim_status then
	--     nvim_status.on_attach(client)
	--   end
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true })
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = true })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = true })
	vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = true })
	vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = true })
	vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = true })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = true })

	--   buf_inoremap { "<c-s>", vim.lsp.buf.signature_help }
	--   buf_nnoremap { "gD", vim.lsp.buf.declaration }
	--   buf_nnoremap { "<space>gI", handlers.implementation }
	--   buf_nnoremap { "<space>lr", "<cmd>lua R('tj.lsp.codelens').run()<CR>" }
	--   buf_nnoremap { "<space>rr", "LspRestart" }
	--   telescope_mapper("gr", "lsp_references", nil, true)
	--   telescope_mapper("gI", "lsp_implementations", nil, true)
	--   telescope_mapper("<space>wd", "lsp_document_symbols", { ignore_filename = true }, true)
	--   telescope_mapper("<space>ww", "lsp_dynamic_workspace_symbols", { ignore_filename = true }, true)
	--   if filetype ~= "lua" then
	--     buf_nnoremap { "K", vim.lsp.buf.hover, { desc = "lsp:hover" } }

	vim.schedule(function() print("LSP is ready") end)

	vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

	-- hightlight current word
	if client.server_capabilities.documentHighlightProvider then
		vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
	end
end




-- An example of configuring for `sumneko_lua`,
--  a language server for Lua.
lspconfig.sumneko_lua.setup({
	-- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" };
	-- An example of settings for an LSP server.
	--    For more options, see nvim-lspconfig
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		}
	},
	on_attach = custom_attach,
	capabilities = updated_capabilities
})

-- read .vscode/settings if there is one. Mainly for ipkiss environment
local get_vscode_python_path = function()
	if vim.fn.filereadable(".vscode/settings.json") ~= 1 then
		-- vim.schedule(function() print("there is no settings.json file") end)
		return
	end

	local io = require("io")
	local file = io.open(".vscode/settings.json")
	if file == nil then
		vim.schedule(function() print("settings.json file not readable") end)
		return
	end
	if file ~= nil then
		local content = file:read "*a"
		file:close()
		local content = content:gsub("%s*//.-\n", "\n") -- https://www.lua.org/pil/20.2.html for lua patterns
		-- print(content)
		local status_ok, table1 = pcall(vim.json.decode, content)
		if not status_ok then
			vim.schedule(function() print(".vscode/settings.json parse failed, check it.") end)
			return
		end
		-- local table1 = vim.fn.json_decode(content)
		local status_ok, vscode_pythonpath = pcall(function() return table1["terminal.integrated.env.linux"].PYTHONPATH end)
		if status_ok then
			vim.g.vscode_pythonpath = vscode_pythonpath
		end
		local status_ok, extraPath = pcall(function() return table1["python.analysis.extraPaths"].PYTHONPATH end)
		if status_ok then
			vim.g.Pyright_analysis_pathv = extraPath
			vim.schedule(function() print("vscode settings for pyright loaded successfuly") end)
			return vim.g.Pyright_analysis_path
		end
	end
end


-- setup pyright
lspconfig.pyright.setup({
	on_attach = function(client)

		-- Read VScode launch.json and add PYTHONPATH
		-- local f = vim.fn.filereadable("launch.json")
		-- local file = io.open(".vscode/launch.json")
		-- if (file ~= nil and vim.g.vscode_pythonpath == nil) then
		-- 	-- local content = file:read "*a"
		-- 	local lines = file:lines()
		-- 	for line in lines do
		-- 		line = line:gsub("%s+", "") -- https://www.lua.org/pil/20.2.html for lua patterns
		-- 		-- print(line)
		-- 		if line:find('^"PY') ~= nil then
		-- 			line = line:gsub('"PYTHONPATH":', "")
		-- 			local pythonpath = line:gsub('"', "")
		-- 			if pythonpath ~= nil then
		-- 				vim.env.PYTHONPATH = vim.env.PYTHONPATH .. ":" .. pythonpath
		-- 				vim.g.vscode_pythonpath = 1
		-- 			end
		-- 		end
		-- 	end
		-- 	file:close()
		-- end

		if (vim.g.vscode_pythonpath ~= nil and vim.g.vscode_pythonpath_done == nil) then
			vim.env.PYTHONPATH = vim.env.PYTHONPATH .. ":" .. vim.g.vscode_pythonpath
			vim.g.vscode_pythonpath_done = 1
		end

		-- local handle = io.popen(command)
		-- local result = handle:read("*a")
		-- handle:close()
		custom_attach(client)
	end,
	capabilities = updated_capabilities,
	flags = {
		debounce_text_changes = nil,
	},
	settings = {
		python = {
			analysis = {
				extraPaths = get_vscode_python_path(),
			}
		}
	}
})

-- other language servers
local servers = {
	-- pyright = true,

	-- rust
	rust_analyzer = true,

	-- go
	gopls = {
		settings = {
			gopls = {
				gofumpt = true
			}
		}
	}
}




local setup_server = function(server, config)
	if not config then
		return
	end

	if type(config) ~= "table" then
		config = {}
	end

	config = vim.tbl_deep_extend("force", {
		-- on_init = custom_init,
		on_attach = custom_attach,
		capabilities = updated_capabilities,
		flags = {
			debounce_text_changes = nil,
		},
	}, config)

	lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
	setup_server(server, config)
end

-- local servers = {
--   gdscript = true,
--   graphql = true,
--   html = true,
--   pyright = true,
--   vimls = true,
--   yamlls = true,
--   eslint = true,

--   cmake = (1 == vim.fn.executable "cmake-language-server"),
--   dartls = pcall(require, "flutter-tools"),

--   clangd = {
--     cmd = {
--       "clangd",
--       "--background-index",
--       "--suggest-missing-includes",
--       "--clang-tidy",
--       "--header-insertion=iwyu",
--     },
--     -- Required for lsp-status
--     init_options = {
--       clangdFileStatus = true,
--     },
--     handlers = nvim_status and nvim_status.extensions.clangd.setup() or nil,
--   },

--   gopls = {
--     root_dir = function(fname)
--       local Path = require "plenary.path"

--       local absolute_cwd = Path:new(vim.loop.cwd()):absolute()
--       local absolute_fname = Path:new(fname):absolute()

--       if string.find(absolute_cwd, "/cmd/", 1, true) and string.find(absolute_fname, absolute_cwd, 1, true) then
--         return absolute_cwd
--       end

--       return lspconfig_util.root_pattern("go.mod", ".git")(fname)
--     end,

--     settings = {
--       gopls = {
--         codelenses = { test = true },
--       },
--     },

--     flags = {
--       debounce_text_changes = 200,
--     },
--   },

--   omnisharp = {
--     cmd = { vim.fn.expand "~/build/omnisharp/run", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
--   },

--   rust_analyzer = {
--     cmd = { "rustup", "run", "nightly", "rust-analyzer" },
--   },

--   elmls = true,
--   cssls = true,

--   tsserver = {
--     init_options = ts_util.init_options,
--     cmd = { "typescript-language-server", "--stdio" },
--     filetypes = {
--       "javascript",
--       "javascriptreact",
--       "javascript.jsx",
--       "typescript",
--       "typescriptreact",
--       "typescript.tsx",
--     },

--     on_attach = function(client)
--       custom_attach(client)

--       ts_util.setup { auto_inlay_hints = false }
--       ts_util.setup_client(client)
--     end,
--   },
-- }

-- for server, config in pairs(servers) do
--   setup_server(server, config)
-- end


-- local custom_lsp_attach = function(client)
-- 	-- See `:help nvim_buf_set_keymap()` for more information
-- 	vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
-- 	vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
-- 	-- ... and other keymappings for LSP

-- 	-- Use LSP as the handler for omnifunc.
-- 	--    See `:help omnifunc` and `:help ins-completion` for more information.
-- 	vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

-- 	-- Use LSP as the handler for formatexpr.
-- 	--    See `:help formatexpr` for more information.
-- 	vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

-- 	-- For plugins with an `on_attach` callback, call them here. For example:
-- 	-- require('completion').on_attach()
-- end
----------------------------------------------------------------------------------------------------------------------------------
