-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- Ustaw leader key, jeśli jeszcze nie jest ustawiony
vim.g.mapleader = " "

-- Opcje mappingu
local opts = { noremap = true, silent = true }

-- Normal mode: SPC f s → zapis pliku
vim.api.nvim_set_keymap("n", "<leader>fs", ":w<CR>", opts)

-- Upload do Pico
vim.keymap.set("n", "<leader>pu", function()
  local file = vim.fn.expand("%:p")
  vim.fn.jobstart("mpremote cp " .. file .. " :", {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Uploaded to Pico!", vim.log.levels.INFO)
      else
        vim.notify("Upload failed!", vim.log.levels.ERROR)
      end
    end,
  })
end, { desc = "Upload to Pico" })

-- Upload jako main.py i zresetuj Pico (uruchom automatycznie)
vim.keymap.set("n", "<leader>pr", function()
  local file = vim.fn.expand("%:p")
  vim.fn.jobstart("mpremote cp " .. file .. " :main.py", {
    on_exit = function(_, code)
      if code == 0 then
        -- Reset Pico żeby uruchomić main.py
        vim.fn.jobstart("mpremote reset", {
          on_exit = function()
            vim.notify("Uploaded and running on Pico!", vim.log.levels.INFO)
          end,
        })
      else
        vim.notify("Upload failed!", vim.log.levels.ERROR)
      end
    end,
  })
end, { desc = "Upload and Run on Pico" })

-- Soft reset (uruchom ponownie bez uploadu)
vim.keymap.set("n", "<leader>ps", function()
  vim.fn.jobstart("mpremote reset", {
    on_exit = function()
      vim.notify("Pico reset!", vim.log.levels.INFO)
    end,
  })
end, { desc = "Soft reset Pico" })
