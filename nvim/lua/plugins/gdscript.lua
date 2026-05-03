return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gdscript = {},
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      if not configs.gdscript then
        configs.gdscript = {
          default_config = {
            cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
            filetypes = { "gd", "gdscript", "gdscript3" },
            root_dir = lspconfig.util.root_pattern("project.godot", ".git"),
          },
        }
      end

      lspconfig.gdscript.setup({})
    end,
  },
}
