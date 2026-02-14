require("nvchad.mappings")

-- add yours here
-- Move current line up/down in normal mode
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Move selected lines up/down in visual mode and reselect
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- <Leader>tn -> next tab
vim.api.nvim_set_keymap("n", "<Leader>tn", ":tabnext<CR>", { noremap = true, silent = true })

-- <Leader>tp -> previous tab
vim.api.nvim_set_keymap("n", "<Leader>tp", ":tabprevious<CR>", { noremap = true, silent = true })

-- Open a new tab
vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })

-- Close current tab
vim.api.nvim_set_keymap("n", "<C-w>", ":tabclose<CR>", { noremap = true, silent = true })

-- Test current LeetCode solution
vim.api.nvim_set_keymap("n", "<Leader>lt", ":Leet test<CR>", { noremap = true, silent = true })

-- Submit current LeetCode solution
vim.api.nvim_set_keymap("n", "<Leader>ls", ":Leet submit<CR>", { noremap = true, silent = true })

--For git diffing
vim.keymap.set("n", "<leader>gd", function()
  if next(require("diffview.lib").views) == nil then
    vim.cmd("DiffviewOpen")
  else
    vim.cmd("DiffviewClose")
  end
end, { desc = "Toggle Global Diff View" })

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
