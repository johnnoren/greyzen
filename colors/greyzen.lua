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

-- include our theme file and pass it to lush to apply
require('lush')(require('lush_theme.greyzen'))
require('lualine').setup { options = { theme = 'greyzen' } }

-- Toggle line number color between normal and bg (for making them invisible)
vim.api.nvim_create_user_command('ToggleLineNrColor', function()
        local lush = require('lush')
        local theme = require('lush_theme.greyzen')
        local hex = function(n)
            return string.format("#%06x", n)
        end
        local current_ln_fg = hex(vim.api.nvim_get_hl_by_name('LineNr', true).foreground)
        local spec = {}
        if current_ln_fg == tostring(theme.LineNr.fg) then
            spec = lush.extends({ harbour }).with(function()
                return {
                    LineNr { fg = theme.Normal.bg },
                    LineNrAbove { fg = theme.Normal.bg },
                    LineNrBelow { fg = theme.Normal.bg },
                }
            end)
        else
            spec = theme
        end
        lush(spec)
    end,
    { nargs = 0, desc = 'Toggle line number color' }
)
