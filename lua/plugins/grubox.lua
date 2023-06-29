return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = "dark"
    vim.g.gruvbox_material_transparent_background = 2
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    vim.g.gruvbox_material_diagnostic_text_highlight = 1
    vim.g.gruvbox_material_diagnostic_line_highlight = 1
    vim.o.termguicolors = true
    vim.cmd.colorscheme("gruvbox-material")
    vim.opt.fillchars = { eob = " " }
  end
}
