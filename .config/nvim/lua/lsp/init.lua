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
	vim.schedule(function() print("LSP is ready")
	end)
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

-- other language servers
local servers = {
	pyright = true,
	rust_analyzer = true,
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
