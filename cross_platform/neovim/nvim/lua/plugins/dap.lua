---@diagnostic disable: undefined-global
local dap = require("dap")
vim.keymap.set("n", "<leader>8", dap.continue, { desc="Debug continue" })
vim.keymap.set("n", "<leader>9", dap.step_over, { desc="Debug step over" })
vim.keymap.set("n", "<leader>0", dap.step_into, { desc="Debug step into" })
vim.keymap.set("n", "<leader>-", dap.step_out, { desc="Debug step out" })
vim.keymap.set("n", "<leader>=", dap.terminate, { desc="Debug terminate" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc="Debug toggle breakpoint" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc="Debug open repl" })
-- **********************C++/C/RUST**************************
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return string.format('%s/build/TESTING', vim.fn.getcwd())
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}
dap.configurations.rust = dap.configurations.cpp
dap.configurations.c = dap.configurations.cpp
--[[ 
*************************PYTHON*******************************
--]]
local venv = os.getenv("VIRTUAL_ENV")
dap.adapters.python = {
  type = 'executable';
  command = string.format("%s/bin/python",venv);
  args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      if vim.fn.executable(string.format('%s/bin/python', venv)) == 1 then
        return string.format('%s/bin/python', venv)
      else
        return '/usr/bin/python'
      end
    end;
  },
}
