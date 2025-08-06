vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.termguicolors = true

vim.o.mouse = "a"
vim.o.number = true
vim.o.relativenumber = true

vim.o.scrolloff = 5
vim.o.sidescrolloff = 15

vim.o.pumheight = 15

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.iskeyword:remove("_")

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.smartindent = true
vim.opt.breakindent = true
vim.o.wrap = false

vim.o.signcolumn = "yes:1"

vim.opt.shortmess:append("sI")

vim.opt.conceallevel = 0

vim.g.have_nerd_font = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.showmode = false
vim.o.cmdheight = 0
vim.o.laststatus = 3

vim.o.showtabline = 0

vim.opt.grepprg = "rg --vimgrep"

vim.opt.spelllang = { "en", "fr" }
vim.opt.spelloptions:append("noplainbuffer")

vim.opt.list = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undodir"
vim.opt.undofile = true

local borderchars = {
  single = {
    style = "single",
    vert = "│",
    vertleft = "┤",
    vertright = "├",
    horiz = "─",
    horizup = "┴",
    horizdown = "┬",
    verthoriz = "┼",
    topleft = "┌",
    topright = "┐",
    botleft = "└",
    botright = "┘",
  },
  double = {
    style = "double",
    vert = "║",
    vertleft = "╣",
    vertright = "╠",
    horiz = "═",
    horizup = "╩",
    horizdown = "╦",
    verthoriz = "╬",
    topleft = "╔",
    topright = "╗",
    botleft = "╚",
    botright = "╝",
  },
  rounded = {
    style = "rounded",
    vert = "│",
    vertleft = "┤",
    vertright = "├",
    horiz = "─",
    horizup = "┴",
    horizdown = "┬",
    verthoriz = "┼",
    topleft = "╭",
    topright = "╮",
    botleft = "╰",
    botright = "╯",
  },
}

vim.g.rustfmt_autosave = 1

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.markdown_recommended_style = 0

if vim.fn.has("unix") == 1 then
  vim.o.shell = "/run/current-system/sw/bin/bash"
end

