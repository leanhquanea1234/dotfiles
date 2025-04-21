return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    vim.keymap.set('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [E]xplorer" })
    require("nvim-tree").setup({
      hijack_netrw = true,
      auto_reload_on_write = true,
      view = {
        side = "right",         -- Positions the tree on the right side
        width = 30,
      },
      git = {
        enable = true, -- Enable Git integration
        ignore = false, -- Do NOT hide files in .gitignore
      },
      filters = {
        dotfiles = false, -- Optional: Show dotfiles (e.g., .config)
      },
    })
  end
}
