return {
	{
		"williamboman/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- LSP Configuration
			local lspconfig = vim.lsp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			--local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Configure LSP servers
			lspconfig.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})

			lspconfig.config("ts_ls", {
				capabilities = capabilities,
			})

			lspconfig.config("pyright", {
				capabilities = capabilities,
			})

			lspconfig.config("rust_analyzer", {
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})

			lspconfig.config("gopls", {
				capabilities = capabilities,
			})

			lspconfig.config("clangd", {
				capabilities = capabilities,
			})
			-- Enable LSP servers
			lspconfig.enable("lua_ls")
			lspconfig.enable("ts_ls")
			lspconfig.enable("pyright")
			lspconfig.enable("rust_analyzer")
			lspconfig.enable("gopls")

			-- LSP Keymaps
			local opts = { noremap = true, silent = true }

			-- Standard LSP keymaps
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "]g", function()
				vim.diagnostic.jump({ count = 1 })
			end, opts)
			vim.keymap.set("n", "[g", function()
				vim.diagnostic.jump({ count = -1 })
			end, opts)
			-- Optional: Trouble.nvim binding
			vim.keymap.set("n", "<Leader>xx", "<cmd>Trouble<CR>", {})
			-- Custom go-to-definition: current tab vs new tab
			local last_buf, last_pos

			local function go_to_definition_in_new_tab_or_current()
				last_buf = vim.api.nvim_get_current_buf()
				last_pos = vim.api.nvim_win_get_cursor(0)
				local params = vim.lsp.util.make_position_params()
				local current_uri = vim.uri_from_bufnr(last_buf)

				vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result)
					if err then
						vim.notify("LSP error: " .. err.message, vim.log.levels.ERROR)
						return
					end

					if not result or vim.tbl_isempty(result) then
						vim.notify("Definition not found", vim.log.levels.INFO)
						return
					end

					local def = vim.tbl_islist(result) and result[1] or result
					local target_uri = def.uri or def.targetUri

					if target_uri == current_uri then
						-- Same file: jump in current buffer
						local range = def.range or def.targetSelectionRange
						vim.api.nvim_win_set_cursor(0, { range.start.line + 1, range.start.character })
					else
						-- Different file: open in new tab
						vim.cmd("tabnew")
						vim.lsp.util.jump_to_location(def, "utf-8")
					end
				end)
			end

			vim.keymap.set("n", "gD", go_to_definition_in_new_tab_or_current, opts)

			-- Go back to previous location
			vim.keymap.set("n", "<leader>b", function()
				if not (last_buf and last_pos) then
					vim.notify("No previous location recorded", vim.log.levels.WARN)
					return
				end

				local winid = vim.fn.bufwinid(last_buf)
				if winid ~= -1 then
					vim.api.nvim_set_current_win(winid)
				else
					vim.cmd("buffer " .. last_buf)
				end
				vim.api.nvim_win_set_cursor(0, last_pos)
			end, opts)

			-- Diagnostic configuration
			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
				},
			})
		end,
	},
}
