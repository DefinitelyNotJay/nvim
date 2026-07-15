return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { 
        "ts_ls", -- TypeScript/JavaScript (previously tsserver)
        "tailwindcss", -- Tailwind CSS for Next.js
        "eslint", -- Linter
        "html", 
        "cssls",
        "pyright", -- Python
      },
    })

    require("lspconfig") -- Load nvim-lspconfig defaults
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = { "ts_ls", "tailwindcss", "eslint", "html", "cssls", "pyright" }
    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
    end
  end,
}
