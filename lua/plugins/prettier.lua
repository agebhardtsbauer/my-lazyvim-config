return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = {
        null_ls.builtins.formatting.prettier,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.cmd([[
            augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ timeout_ms = 2000 })
            augroup END
          ]])
        end
      end,
    },
  },
}
