
--[[

TODO: Bind a key to:

global.no_show_clutter = not global.no_show_clutter

if global.no_show_clutter:
    :set colorcolumn=0
    :Gitsigns detach
    :set norelativenumber
    :set nonumber
    :LspStop
else:
    :set colorcolumn=100
    :Gitsigns attach
    :set relativenumber
    :LspStart

]]--
