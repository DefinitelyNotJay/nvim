local M = {}

function M.options()
  return {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  }
end

function M.run()
  require("conform").format(M.options())
end

return M
