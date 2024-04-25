-- options to pass to the keymap function
local opts = { noremap = true , silent = true }
-- shorting the function name
local map = vim.api.nvim_set_keymap

-- setting a leader key
map("", "<Space>", "<Nop>", opts) -- making sure that the Space key maped to nothing
vim.g.mapleader = " "             -- setting the leader key to be the Space key
vim.g.maplocalleader = " "        -- same for local

-- Normal mode keybinds --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Toggling left file explorer
map("n", "<leader>e", ":Neotree filesystem reveal left<CR>", opts)

-- Spliting windows
map("n", "<leader>v", ":vsplit<CR>", opts)
map("n", "<leader>s", ":split<CR>", opts)

-- Resizing windows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize +2<CR>", opts)
map("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Moving between buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Openning terminal 
map("n", "<leader>q", ":vsplit | terminal<CR>", opts)

-- Quiting windows without saving
map("n", "<leader>c", ":quit<CR>", opts)
-- Saving
map("n", "<leader>w", ":write | quit<CR>", opts)


-- Insert mode keybinds --
-- going out to Normal mode using Alt + j
map("i", "<A-j>", "<ESC>", opts)


-- Visual mode keybinds --
-- Stay in indent mode 
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move a block of text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Paste the last thing that beven copied (vim replace the copied text with the text that been overwriting by the paste)
map("v", "p", "_dP", opts)

-- Terminal mode keybinds --

-- Exiting the terminal
map("t", "<A-c>", "<C-\\><C-n>", { silent = true })

 


