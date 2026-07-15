local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source current file" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- paste over selection without loosing yanked
vim.keymap.set("x", "p", [["_dP]])

-- leader d delete wont remember as yanked/clipboard when delete pasting
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- ==========================================
-- Core / Editing
-- ==========================================
vim.keymap.set("n", "<leader>f", require("Tendou.utils.format").run, { desc = "Format buffer" })

-- prevent x delete from registering when next paste
vim.keymap.set("n", "x", '"_x', opts)

-- Replace the word cursor is on globally
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })
-- Executes shell command from in here making file executable
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- tab stuff
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")   --open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") --close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")     --go to next
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")     --go to pre
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") --open current tab in new tab

--split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
    local filePath = vim.fn.expand("%:~")
    vim.fn.setreg("+", filePath)
    print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- restart 
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart Neovim (:restart)" })

vim.keymap.set("n", "<leader>lr", function()
    vim.cmd("LspRestart")
    vim.notify("LSP restarted", vim.log.levels.INFO)
end, { desc = "Restart LSP" })

-- Mason
vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Open Mason UI" })

-- ==========================================
-- Telescope
-- ==========================================
-- 4 ตัวนี้ใช้แบบ <cmd> เหมือนของเดิมของคุณ ปลอดภัย 100%
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>", { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>", { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", { desc = 'Telescope help tags' })

-- ส่วนที่เพิ่มใหม่ ใช้ function() ครอบไว้ เพื่อให้ทำงานตอนกดปุ่ม
vim.keymap.set('n', '<leader>fr', function() require('telescope.builtin').oldfiles() end, { desc = 'Telescope find recent files' })
vim.keymap.set('n', '<leader>fc', function() require('telescope.builtin').grep_string() end, { desc = 'Telescope find word under cursor' })

vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzy search in current buffer' })

-- ==========================================
-- Harpoon 2
-- ==========================================
-- Mark ไฟล์ปัจจุบันเข้า Harpoon list
vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Harpoon: Add file" })

-- เปิดหน้าต่าง Harpoon แบบลอยขึ้นมา
vim.keymap.set("n", "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Harpoon: Toggle menu" })

-- กระโดดไปไฟล์ที่ 1-4
vim.keymap.set("n", "<leader>1", function() require("harpoon"):list():select(1) end, { desc = "Harpoon: Go to file 1" })
vim.keymap.set("n", "<leader>2", function() require("harpoon"):list():select(2) end, { desc = "Harpoon: Go to file 2" })
vim.keymap.set("n", "<leader>3", function() require("harpoon"):list():select(3) end, { desc = "Harpoon: Go to file 3" })
vim.keymap.set("n", "<leader>4", function() require("harpoon"):list():select(4) end, { desc = "Harpoon: Go to file 4" })
vim.keymap.set("n", "<leader>5", function() require("harpoon"):list():select(5) end, { desc = "Harpoon: Go to file 5" })
