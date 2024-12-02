vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
      "doums/darcula",
  }
  -- набор Lua функций, используется как зависимость в большинстве
  -- плагинов, где есть работа с асинхронщиной
  use 'nvim-lua/plenary.nvim'
  
    
  -- конфиги для LSP серверов, нужен для простой настройки и
  -- возможности добавления новых серверов
  use 'neovim/nvim-lspconfig'

  -- зависимости для движка автодополнения
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'APZelos/blamer.nvim'

  -- движок автодополнения для LSP
  use 'hrsh7th/nvim-cmp'

   -- движок сниппетов
  use {
    'L3MON4D3/LuaSnip',
    after = 'friendly-snippets',
    config = function()
      require('luasnip/loaders/from_vscode').load({
       paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
      })
    end
  }
    
  -- автодополнения для сниппетов
  use 'saadparwaiz1/cmp_luasnip'
    
  -- набор готовых сниппетов для всех языков, включая go
  use 'rafamadriz/friendly-snippets'

    -- автоматические закрывающиеся скобки
  use {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup()
    end
  }

  -- иконки в выпадающем списке автодополнений (прямо как в vscode)
  use('onsails/lspkind-nvim')

  -- парсер для всех языков программирования, цветной код как в твоем
  -- любимом IDE
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        -- так подгружается конфигурация конкретного плагина
        -- ~/.config/nvim/lua/plugins/treesitter.lua
        require('plugins.treesitter') 
      end
  }
  use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
          vim.g.mkdp_filetypes = { "markdown" }
      end,
      config = function()
          vim.g.mkdp_filetypes = { "markdown" }
          vim.g.mkdp_auto_start = 1
      end,
      ft = { "markdown" },
  }

    
  -- навигация по файлам, fzf, работа с буферами и многое другое
  -- если больше привыкли к файловому дереву, есть альтернатива - nvim-tree
 	-- https://github.com/kyazdani42/nvim-tree.lua
  use {
  'nvim-telescope/telescope.nvim',
  config = function()
  require('plugins.telescope')
  end
 } 
  use {
    'olexsmir/gopher.nvim',
    config = function()
      require('plugins.gopher')
    end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
        'nvim-tree/nvim-web-devicons', -- optional
            config = function()
      require("nvim-web-devicons").setup()

      require("nvim-tree").setup {
        hijack_cursor = true,
        view = {
          width = 40
        },
        git = {
            ignore = false,
            enable = true,
            timeout = 400
        }
      }
    end
    },
}
end)
