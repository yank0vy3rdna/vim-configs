local opt = vim.opt -- as a shorthand

-- disable the startup splash screen
opt.shortmess:append("I")

opt.nu = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.isfname:append('@-@')

opt.updatetime = 50
opt.colorcolumn = '120'

vim.g.mapleader = ' '
local colorscheme = "darcula"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
 print("Colorscheme " .. colorscheme .. " not found!") -- Print an error message if the colorscheme is not installed
  return
end
