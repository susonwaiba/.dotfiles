return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'mfussenegger/nvim-dap',
        init = function()
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = false,
                float = true,
            })

            vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons
        end,
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            dap.adapters.php = {
                type = 'executable',
                command = 'node',
                args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" }
                -- args = { '/path/to/vscode-php-debug/out/phpDebug.js' }
            }

            dap.configurations.php = {
                {
                    type = 'php',
                    request = 'launch',
                    name = 'Listen for Xdebug',
                    hostname = '127.0.0.1',
                    port = 9003
                }
            }

            dapui.setup()

            vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { desc = "Continue" })
            vim.keymap.set("n", "<leader>dso", ":lua require'dap'.step_over()<CR>", { desc = "Step over" })
            vim.keymap.set("n", "<leader>dsi", ":lua require'dap'.step_into()<CR>", { desc = "Step into" })
            vim.keymap.set("n", "<leader>dsO", ":lua require'dap'.step_out()<CR>", { desc = "Step out" })
            vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
            vim.keymap.set("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
            vim.keymap.set("n", "<leader>dp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
            vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
            vim.keymap.set("n", "<leader>do", ":lua require'dapui'.toggle()<CR>", { desc = "DapUI" })
        end
    },
}
