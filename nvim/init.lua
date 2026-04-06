print("HELLO FROM NEOVIM!")
--vim.cmd("set number")
--vim.cmd("set relativenumber")
vim.cmd("set mouse=a")
--vim.cmd("set autoindent")

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.cmd("colorscheme koehler")
-- vim.cmd("colorscheme murphy")

-- Switch window Begin
vim.keymap.set('n', '<C-h>', [[<C-w>h]], {noremap = true})
vim.keymap.set('n', '<C-j>', [[<C-w>j]], {noremap = true})
vim.keymap.set('n', '<C-k>', [[<C-w>k]], {noremap = true})
vim.keymap.set('n', '<C-l>', [[<C-w>l]], {noremap = true})
-- Switch window End

-- Open terminal Begin
vim.g.mapleader = " "
-- Helper function to open terminal in a specific direction
local function open_term(cmd)
    vim.cmd(cmd .. " | terminal")
end

-- 1. Opening Terminals
vim.keymap.set('n', '<leader>tb', function() open_term("botright split") end)   -- T Bottom
vim.keymap.set('n', '<leader>tt', function() open_term("topleft split") end)    -- T Top
vim.keymap.set('n', '<leader>tl', function() open_term("topleft vsplit") end)   -- T Left
vim.keymap.set('n', '<leader>tr', function() open_term("botright vsplit") end)  -- T Right

-- 2. Escaping Terminal Mode
-- Default is <C-\><C-n>, which is hard to press. Map it to <Esc>.
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})

-- 3. Window Navigation from Terminal
-- This allows you to jump out of the terminal to other windows directly
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], {noremap = true})
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], {noremap = true})
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], {noremap = true})
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], {noremap = true})

-- Open terminal End
require("config.lazy")

