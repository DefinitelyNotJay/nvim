return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    configs.setup({
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "lua",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
