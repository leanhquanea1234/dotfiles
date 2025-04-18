return {
  "lervag/vimtex",
  config = function()
    vim.g.vimtex = {
      view_method = "zathura",
      compiler_method = "latexmk",
      quickfix_enabled = 1,
      indent_enabled = 1,
      syntax_enabled = 1,
      conceal_enabled = 1,
      tex_flavor = "latex",

      compiler_latexmk = {
        build_dir = "build",
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-file-line-error",
          "-synctex=1",
          "-shell-escape"
        }
      }
    }
    vim.api.nvim_set_keymap('n', '<leader>ll', '<plug>(vimtex-compile)', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>lv', '<plug>(vimtex-view)', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>lo', '<plug>(vimtex-compile-output)', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>lt', '<plug>(vimtex-toc-toggle)', { noremap = true, silent = true })
  end
}
