return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_foreground = "material"
    vim.g.gruvbox_material_background = "medium"
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    vim.g.gruvbox_material_diagnostic_text_highlight = 1
    vim.g.gruvbox_material_diagnostic_line_highlight = 1
    vim.g.gruvbox_material_show_eob = 0
    vim.g.gruvbox_material_diagnostic_line_highlight = 1
    vim.gruvbox_material_dim_inactive_windows = 1
    vim.o.termguicolors = true
    vim.g.gruvbox_material_statusline_style = 'mix'
    vim.cmd.colorscheme("gruvbox-material")
    vim.cmd [[
    highlight StatusLine ctermbg=NONE guibg=NONE
    highlight StatusLineNC ctermbg=NONE guibg=NONE
    set statusline=%{repeat('\ ',winwidth('.'))}
    highlight FloatBorder ctermbg=NONE guibg=NONE
    highlight PMenu ctermbg=NONE guibg=NONE
    ]]
  end
}
