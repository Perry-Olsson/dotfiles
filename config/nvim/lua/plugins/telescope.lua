---@diagnostic disable: undefined-global
--[[ 
**************************************************************
**********************TELESCOPE CONFIG************************
**************************************************************
--]]
local get_opts = function(desc)
    return { noremap=true, silent=true, desc=desc }
end
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fl', function()
  require('telescope.builtin').live_grep({
    additional_args = function(args)
      return { "--hidden" }
    end
  })
end, { desc = "Live Grep (including hidden)" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope find_files hidden=true<cr>", get_opts("Find files (include hidden)"))
local action_state = require('telescope.actions.state')

-- Grow/shrink the preview window by `delta` (fraction of the picker width)
-- while the picker is open. Resets when the picker is closed.
local resize_preview = function(delta)
    return function(prompt_bufnr)
        local picker = action_state.get_current_picker(prompt_bufnr)
        local strategy = picker.layout_strategy
        picker.layout_config = picker.layout_config or {}
        picker.layout_config[strategy] = picker.layout_config[strategy] or {}

        local current = picker.layout_config[strategy].preview_width
            or picker.layout_config.preview_width
            or 0.5
        -- preview_width may be a function or padding table; nothing to increment
        if type(current) ~= 'number' then
            return
        end

        local new = math.min(0.9, math.max(0.1, current + delta))
        -- strategy-specific values win during resolution, so set both
        picker.layout_config.preview_width = new
        picker.layout_config[strategy].preview_width = new
        picker:full_layout_update()
    end
end

require('telescope').setup{
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            width = 0.99,
            height = 0.80,
            preview_width = 0.45,
        },
        mappings = {
            i = {
                ['<C-h>'] = resize_preview(0.05),
                ['<C-l>'] = resize_preview(-0.05),
            },
            n = {
                ['<C-h>'] = resize_preview(0.05),
                ['<C-l>'] = resize_preview(-0.05),
            },
        },
    }
}
