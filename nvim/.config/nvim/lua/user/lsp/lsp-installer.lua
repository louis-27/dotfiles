local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
  
  -- if server.name == "tw_highlight" then
  --   local tw_highlight_opts = require("user.lsp.settings.tw_highlight")
  --   opts = vim.tbl_deep_extend("force", tw_highlight_opts, opts)
  -- end

	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
