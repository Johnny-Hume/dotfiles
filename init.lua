vim.g.mapleader = ","  -- Set leader key to comma

-- Basic settings
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set autoindent")
vim.cmd("set shiftwidth=4")
vim.cmd("set noswapfile")
vim.cmd("set colorcolumn=80")

-- Key mappings
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>lt', ':Leet test<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ls', ':Leet submit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>cd', ':CocDisable<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ce', ':CocEnable<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>rf', ':w<CR>:!python3 %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', ':w !pbcopy<CR>u<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Tab>', 'coc#pum#visible() ? coc#pum#confirm() : "<Tab>"', { expr = true, noremap = true, silent = true })

vim.api.nvim_create_user_command('FormatAutopep8', function()
    vim.cmd('!autopep8 --in-place %')
    vim.cmd('edit')
end, {})

vim.api.nvim_set_keymap('n', '<leader>fo', ':FormatAutopep8<CR><CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})

vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>wi", ":CocCommand workspace.inspectEdit<CR>", {silent = true})

-- Formatting selected code
vim.api.nvim_set_keymap("x", "<leader>pf", "<Plug>(coc-format-selected)", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>pf", "<Plug>(coc-format-selected)", {silent = true})

-- Comment out lines
vim.api.nvim_set_keymap("n", "<leader>cc", ":Commentary<CR>", {silent = true})
vim.api.nvim_set_keymap("v", "<leader>cc", ":Commentary<CR>", {silent = true})
-- Specify the path to lazy.nvim
vim.opt.rtp:prepend("~/.local/share/nvim/site/pack/packer/start/lazy.nvim")

-- Load Lazy.nvim
require('lazy').setup({

    {
	"tpope/vim-commentary"
    },
    {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},
    {
	"vim-airline/vim-airline"
    },

    -- colourschemes
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },
    {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').load()
    end
    },
    {
      "vague2k/vague.nvim",
      config = function()
	require("vague").setup({
	  -- optional configuration here
	})
      end
    },
    {
	'neoclide/coc.nvim', branch = 'release' 
    },
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  },
  
  -- File tree plugin
  {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',  -- Optional for file icons
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('nvim-tree').setup {
        disable_netrw = true,
        hijack_netrw = true,
        open_on_tab = false,
        update_cwd = true,
      }
    end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',  -- Automatically update parsers
    config = function()
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true,  -- Enable highlighting
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,  -- Enable Treesitter-based indentation
        },
        ensure_installed = { "c", "lua", "python", "javascript", "html", "css", "java" },  -- Languages to install
      }
    end,
  },

  -- LeetCode Plugin
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",  -- Run TSUpdate for HTML
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",  -- Required by telescope
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("leetcode").setup {
        arg = "leetcode.nvim",
        lang = "python3",
        cn = {
          enabled = false,
          translator = true,
          translate_problems = true,
        },
        storage = {
          home = vim.fn.stdpath("data") .. "/leetcode",
          cache = vim.fn.stdpath("cache") .. "/leetcode",
        },
        plugins = {
          non_standalone = false,
        },
        logging = true,
        cache = {
          update_interval = 60 * 60 * 24 * 7,  -- 7 days
        },
        console = {
          open_on_runcode = true,
          dir = "row",
          size = {
            width = "90%",
            height = "75%",
          },
          result = {
            size = "60%",
          },
          testcase = {
            virt_text = true,
            size = "40%",
          },
        },
        description = {
          position = "left",
          width = "40%",
          show_stats = true,
        },
        keys = {
          toggle = { "q" },
          confirm = { "<CR>" },
          reset_testcases = "r",
          use_testcase = "U",
          focus_testcases = "H",
          focus_result = "L",
        },
        theme = {},
        image_support = false,
      }
    end,
  },

      {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  }
})

require("telescope").setup {
    defaults = {
	file_ignore_patterns = {"venv/", "__pycache__/"}
    }
}

require('refactoring').setup({})

vim.cmd[[colorscheme nordic]]
