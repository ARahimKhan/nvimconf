vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })
keymap.set("n", "U", "<cmd>redo<CR>", { desc = "Saner redo" })

keymap.set("n", "<C-f>", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center screen after scroll down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center screen after scroll up" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>qb", "<cmd>%bd|e#|bd#<CR>", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Vertical splits (width)
keymap.set("n", "<leader><C-Left>", ":vertical resize -5<CR>", { desc = "Decrease vertical split" })
keymap.set("n", "<leader><C-Right>", ":vertical resize +5<CR>", { desc = "Increase vertical split" })

-- Horizontal splits (height)
keymap.set("n", "<leader><C-Up>", ":resize +2<CR>", { desc = "Decrease horizontal split" })
keymap.set("n", "<leader><C-Down>", ":resize -2<CR>", { desc = "Increase horizontal split" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down, keep cursor in the middle" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up, keep cursor in the middle" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<Home>", "^", { desc = "Go to first char in line" })
keymap.set("i", "<Home>", "^i", { desc = "Go to first char in line" })

keymap.set("n", "<C-\\>", "<C-w>v<C-]>", { desc = "Open definition in vertical split" })

-- disable the weird useless movement bindings
keymap.set("n", "<S-Down>", "", { desc = "Unbind whatever it was" })
keymap.set("n", "<S-Up>", "", { desc = "Unbind whatever it was" })

keymap.set("n", "<C-S-Right>", "l", { desc = "Move to right vertical split" })
keymap.set("n", "<C-S-Left>", "h", { desc = "Move to left vertical split" })

-- codecompanion
keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<CR>")
keymap.set("v", "<leader>ca", "<cmd>CodeCompanionChat Add<CR>")
keymap.set("n", "<leader>cf", "ggVG<cmd>CodeCompanionChat Add<CR>")
keymap.set("n", "<leader>cq", "<cmd>CodeCompanionChat Toggle<CR>")
keymap.set("n", "<leader>ci", "<cmd>CodeCompanion<CR>")
