return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function ()
    vim.g.gruvbox_material_background = "medium"
    vim.g.gruvbox_material_transparent_background = 2
    vim.o.termguicolors = true
    vim.cmd.colorscheme("gruvbox-material")
    vim.opt.fillchars = { eob = " "}
  end
}
