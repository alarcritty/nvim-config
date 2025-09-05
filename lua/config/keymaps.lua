local keymap = vim.keymap
local opts = {noreamp = true, silent = true}

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n","-", "<C-x>")

--Delete a word backwards
keymap.set("n","dw", "vb_d")

--Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
