-- TODO: Merge with ./woynert-colorscheme-fixes.lua and ../../lua/plugins/themes.lua
--vim.cmd([[colorscheme woytheme1]])
--vim.cmd([[colorscheme PaperColor]])
--vim.cmd [[colorscheme srcery]]
--vim.cmd [[colorscheme edge]]
--vim.cmd [[colorscheme oxocarbon]]
--vim.cmd [[colorscheme blue]]

-- Random
math.randomseed(vim.loop.now())
local colorschemes = {
    "blue",
    "darkblue",
    "desert",
    "PaperColor",
    "unokai",
    "ron",
    "quiet",
    --"default",
    "elflord",
    "habamax",
    "retrobox",
    "wildcharm"
}

function select_random_colorscheme()
    local chosen = colorschemes[math.random(#colorschemes)]
    vim.cmd.colorscheme(chosen)
    print("Colorscheme chosen [[" .. chosen .. "]]")
end

vim.api.nvim_create_user_command('RandColorscheme', select_random_colorscheme, {})
select_random_colorscheme()


--Run with luafile %
--vim.cmd.colorscheme("unokai")
--vim.cmd.colorscheme("sorbet")
--vim.cmd.colorscheme("murphy")
--vim.cmd.colorscheme("pablo")
--vim.cmd.colorscheme("oxocarbon")
--vim.cmd.colorscheme("PaperColor")
--vim.cmd.colorscheme("blue")
--vim.cmd.colorscheme("desert")
--vim.cmd.colorscheme("darkblue")
--vim.cmd.colorscheme("vim")
--vim.cmd.colorscheme("edge")
--vim.cmd.colorscheme("woytheme1")
--vim.cmd.colorscheme("ron")
--vim.cmd.colorscheme("delek")
--vim.cmd.colorscheme("quiet")
--vim.cmd.colorscheme("shine")
--vim.cmd.colorscheme("slate")
--vim.cmd.colorscheme("torte")
--vim.cmd.colorscheme("default")
--vim.cmd.colorscheme("elflord")
--vim.cmd.colorscheme("evening")
--vim.cmd.colorscheme("habamax")
--vim.cmd.colorscheme("koehler")
--vim.cmd.colorscheme("morning")
--vim.cmd.colorscheme("zellner")
--vim.cmd.colorscheme("industry") --
--vim.cmd.colorscheme("retrobox")
--vim.cmd.colorscheme("zaibatsu")
--vim.cmd.colorscheme("peachpuff")
--vim.cmd.colorscheme("wildcharm")
--vim.cmd.colorscheme("lunaperche")

