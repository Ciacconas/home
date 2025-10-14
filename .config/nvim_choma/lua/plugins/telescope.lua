return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    event = 'VimEnter',
    version = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      "nvim-treesitter/nvim-treesitter",
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      'nvim-telescope/telescope-live-grep-args.nvim',
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    opts = {
      config = function() end,
    },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { 'node_modules', 'package-lock.json' },
        },
        theme = 'dropdown',
        initial_mode = 'insert',
        select_strategy = 'ascending',
        sorting_strategy = nil,
        layout_strategy = nil,
        layout_config = {},
        path_display = { 'smart' },
        winblend = 0,
        border = {},
        borderchars = nil,
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' },
        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            --@usage don't include the filename in the search results
            only_sort_text = true,
          },
          grep_string = {
            only_sort_text = true,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          },
        },
      }

      local telescope = require 'telescope'
      telescope.load_extension 'fzf'
      telescope.load_extension 'ui-select'

      -- custom file search. <C-p> for git files with fallback to all files(ignore gitignore)
      -- map("n", "<C-p>", telescope.git_files, opts)
      local opts = { noremap = true, silent = true }
      local map = vim.keymap.set

      -- Utility to check if .gitignore exists in current working dir
      -- if it does, use git_files, otherwise use find_files
      local Path = require 'plenary.path'
      local function has_local_gitignore()
        local cwd = vim.fn.getcwd()
        local gitignore_path = Path:new(cwd, '.gitignore')
        return gitignore_path:exists()
      end
      map('n', '<C-p>', function()
        if has_local_gitignore() then
          require('telescope.builtin').git_files {
            -- layout_config = {
            --   preview_width = 0.65,
            -- },
          }
        else
          require('telescope.builtin').find_files {
            find_command = { 'rg', '--no-ignore-vcs', '--files' },
            -- layout_config = {
            --   preview_width = 0.65,
            -- },
          }
        end
      end, opts)

      map('n', '<C-f>', function()
        if has_local_gitignore() then
          print("has local gitignore")
          require('telescope.builtin').live_grep {
            layout_config = {
              preview_width = 0.65,
            },
          }
        else
          -- print("no local gitignore")
          require('telescope.builtin').live_grep {
            additional_args = { '--no-ignore' },
            layout_config = {
              preview_width = 0.65,
            },
          }
        end
      end, opts)
      -- -- older implementation
      -- map('n', '<C-p>', function()
      --   local ok = pcall(require('telescope.builtin').git_files)
      --   if not ok then
      --     print "git_files failed"
      --     require('telescope.builtin').find_files {
      --       find_command = { 'rg', '--no-ignore', '--files' },
      --     }
      --   end
      -- end, opts)

      -- custom file search. <leader>ff for all files (ignore gitignore)
      map('n', '<leader>ff', function()
        require('telescope.builtin').find_files { find_command = { 'rg', '--no-ignore', '--files' } }
      end, opts)

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Telescope commands' })

      -- -- See `:help telescope.builtin`
      -- local builtin = require 'telescope.builtin'
      -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      -- vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      -- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- -- It's also possible to pass additional configuration options.
      -- --  See `:help telescope.builtin.live_grep()` for information about particular keys
      -- vim.keymap.set('n', '<leader>s/', function()
      --   builtin.live_grep {
      --     grep_open_files = true,
      --     prompt_title = 'Live Grep in Open Files',
      --   }
      -- end, { desc = '[S]earch [/] in Open Files' })

      -- -- Shortcut for searching your Neovim configuration files
      -- vim.keymap.set('n', '<leader>sn', function()
      --   builtin.find_files { cwd = vim.fn.stdpath 'config' }
      -- end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
