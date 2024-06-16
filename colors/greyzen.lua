-- You probably always want to set this in your vim file
vim.opt.background = 'dark'
vim.g.colors_name = 'greyzen'

-- By setting our module to nil, we clear lua's cache,
-- which means the require ahead will *always* occur.
--
-- This isn't strictly required but it can be a useful trick if you are
-- incrementally editing your config a lot and want to be sure your themes
-- changes are being picked up without restarting neovim.
--
-- Note if you're working in on your theme and have :Lushify'd the buffer,
-- your changes will be applied with our without the following line.
--
-- The performance impact of this call can be measured in the hundreds of
-- *nanoseconds* and such could be considered "production safe".
package.loaded['lush_theme.greyzen'] = nil

-- Add custom highlight groups
local add_hl_groups = function()
    -- Markdown checkboxes coloring
    vim.cmd 'hi link CheckboxUnchecked @markup.heading.2.markdown'
    vim.cmd 'hi link CheckboxChecked Comment'
    vim.cmd 'hi link Important Error'
end

local match_hl_groups = function()
    -- Markdown checkboxes coloring
    local unchecked_pattern = [[^\s*\[[ \t]\] ]]
    vim.fn.matchadd("CheckboxUnchecked", unchecked_pattern)
    local checked_pattern = [[^\s*\[[xX]\] .*$]]
    vim.fn.matchadd("CheckboxChecked", checked_pattern)
    local important_pattern = [[IMPORTANT]]
    vim.fn.matchadd("Important", important_pattern)
end

-- Apply matching rules when window is opened
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter', 'VimEnter' }, { pattern = { '*' }, callback = match_hl_groups })

-- include our theme file and pass it to lush to apply
local lush = require('lush')
local theme = require('lush_theme.greyzen')
lush(theme)
require('lualine').setup { options = { theme = 'greyzen' } }
add_hl_groups()


-- Toggle line number color between normal and bg (for making them invisible)
local toggled = false
vim.api.nvim_create_user_command('ToggleLineNrColor', function()
        local spec = {}
        if (not toggled) then
            spec = lush.extends({ theme }).with(function()
                return {
                    LineNr { fg = theme.Normal.bg },
                    LineNrAbove { fg = theme.Normal.bg },
                    LineNrBelow { fg = theme.Normal.bg },
                }
            end)
            toggled = true
        else
            spec = theme
            toggled = false
        end
        lush(spec)
        require('lualine').setup { options = { theme = 'greyzen' } }
        add_hl_groups()
    end,
    { nargs = 0, desc = 'Toggle line number color' }
)
vim.cmd('ToggleLineNrColor')
