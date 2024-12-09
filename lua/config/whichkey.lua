local M = {}


function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local mappings = {
    { "<leader>b", group = "Buffer", nowait = false, remap = false },
    { "<leader>bD", "<Cmd>%bd|e#|bd#<Cr>", desc = "Delete all buffers", nowait = false, remap = false },
    { "<leader>bc", "<Cmd>bd!<Cr>", desc = "Close current buffer", nowait = false, remap = false },
    { "<leader>g", group = "Git", nowait = false, remap = false },
    { "<leader>gs", "<cmd>Neogit<CR>", desc = "Status", nowait = false, remap = false },
    { "<leader>q", "<cmd>q!<CR>", desc = "Quit", nowait = false, remap = false },
    { "<leader>w", "<cmd>update!<CR>", desc = "Save", nowait = false, remap = false },
    { "<leader>z", group = "Packer", nowait = false, remap = false },
    { "<leader>zS", "<cmd>PackerStatus<cr>", desc = "Status", nowait = false, remap = false },
    { "<leader>zc", "<cmd>PackerCompile<cr>", desc = "Compile", nowait = false, remap = false },
    { "<leader>zi", "<cmd>PackerInstall<cr>", desc = "Install", nowait = false, remap = false },
    { "<leader>zs", "<cmd>PackerSync<cr>", desc = "Sync", nowait = false, remap = false },
    { "<leader>zu", "<cmd>PackerUpdate<cr>", desc = "Update", nowait = false, remap = false },
  }

	whichkey.add(mappings)
end

return M
