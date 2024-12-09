function check_leader_h()
    -- Create a key mapping for Leader + h
    vim.keymap.set('n', '<Leader>h', function()
        -- Echo a message when Leader + h is pressed
        vim.api.nvim_echo({{"Leader + h was pressed!", "WarningMsg"}}, false, {})
    end, { noremap = true, silent = false })
end

-- Call the function to set up the mapping
check_leader_h()


local M = {}

function M.setup()
  local packer_bootstrap = false

  local conf = {
    display = {
      open_fn =function()
	return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
	"git",
	"clone",
	"--depth",
	"1",
	"https://github.com/wbthomason/packer.nvim",
	install_path,
      }
      vim.cmd [[packadd packer.vim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- colorscheme
    use {
      "sainnhe/everforest",
      config = function()
      	vim.cmd "colorscheme everforest"
      end,
    }

    use {
      "goolord/alpha-nvim",
      config = function()
	require("config.alpha").setup()
      end,
    }

    use {
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

    use {
			"folke/which-key.nvim",
			config = function()
			 require("config.whichkey").setup()
			end,
    }


    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)

end

return M
