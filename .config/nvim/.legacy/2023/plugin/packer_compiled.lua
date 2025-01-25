-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/woynert/.cache/nvim/packer_hererocks/2.1.1693350652/share/lua/5.1/?.lua;/home/woynert/.cache/nvim/packer_hererocks/2.1.1693350652/share/lua/5.1/?/init.lua;/home/woynert/.cache/nvim/packer_hererocks/2.1.1693350652/lib/luarocks/rocks-5.1/?.lua;/home/woynert/.cache/nvim/packer_hererocks/2.1.1693350652/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/woynert/.cache/nvim/packer_hererocks/2.1.1693350652/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n™\2\0\0\5\0\16\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0'\4\15\0B\0\4\1K\0\1\0\26<cmd>AerialToggle<CR>\14<leader>a\6n\bset\vkeymap\bvim\fkeymaps\1\0\1\6o\19actions.scroll\nfloat\1\0\1\rrelative\veditor\vlayout\1\0\2\14placement\tedge\22default_direction\nfloat\1\0\1\16attach_mode\vglobal\nsetup\vaerial\frequire\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["conform.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  edge = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/edge",
    url = "https://github.com/sainnhe/edge"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["headlines.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14headlines\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/opt/headlines.nvim",
    url = "https://github.com/woynert/headlines.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nC\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\bcfg\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n|\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\rchromium\17mkdp_browser\25mkdp_combine_preview\20mkdp_auto_close\6g\bvim\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["marks.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/ValJed/marks.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.cursorword"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ndelay\3È\1\nsetup\20mini.cursorword\frequire\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/mini.cursorword",
    url = "https://github.com/echasnovski/mini.cursorword"
  },
  ["mini.map"] = {
    config = { "\27LJ\2\n&\0\0\2\0\2\0\0046\0\0\0009\0\1\0B\0\1\1K\0\1\0\vtoggle\fMiniMap¼\2\1\0\b\0\21\1#6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\a\0004\4\4\0009\5\3\0009\5\4\5B\5\1\2>\5\1\0049\5\3\0009\5\5\5B\5\1\2>\5\2\0049\5\3\0009\5\6\5B\5\1\0?\5\0\0=\4\b\0035\4\f\0009\5\t\0009\5\n\5'\a\v\0B\5\2\2=\5\r\4=\4\14\3B\1\2\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\19\0003\5\20\0B\1\4\1K\0\1\0\0\14<leader>m\6n\bset\vkeymap\bvim\fsymbols\vencode\1\0\0\b4x2\bdot\23gen_encode_symbols\17integrations\1\0\0\15diagnostic\rgitsigns\19builtin_search\20gen_integration\nsetup\rmini.map\frequire\a€€À™\4\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/mini.map",
    url = "https://github.com/echasnovski/mini.map"
  },
  ["mini.tabline"] = {
    config = { "\27LJ\2\nz\0\2\a\0\a\0\0176\2\0\0009\2\1\0028\2\0\0029\2\2\2\15\0\2\0X\3\2€'\2\3\0X\3\1€'\2\4\0006\3\5\0009\3\6\3\18\5\0\0\18\6\1\0B\3\3\2\18\4\2\0&\3\4\3L\3\2\0\19default_format\16MiniTabline\5\a+ \rmodified\abo\bvimQ\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\vformat\1\0\0\0\nsetup\17mini.tabline\frequire\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/mini.tabline",
    url = "https://github.com/echasnovski/mini.tabline"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  nerdcommenter = {
    config = { "\27LJ\2\n;\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\30NERDCreateDefaultMappings\6g\bvim\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-hl-mdcodeblock.lua"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16minumum_len\3\30\nsetup\19hl-mdcodeblock\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/opt/nvim-hl-mdcodeblock.lua",
    url = "https://github.com/yaocccc/nvim-hl-mdcodeblock.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/papercolor-theme",
    url = "https://github.com/NLKNguyen/papercolor-theme"
  },
  playground = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rainbow-delimiters.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\29rainbow-delimiters.setup\frequire\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/rainbow-delimiters.nvim",
    url = "https://github.com/HiPhish/rainbow-delimiters.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["telescope-command-palette.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/telescope-command-palette.nvim",
    url = "https://github.com/LinArcX/telescope-command-palette.nvim"
  },
  ["telescope-gitmoji.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/telescope-gitmoji.nvim",
    url = "https://github.com/olacin/telescope-gitmoji.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-prosession"] = {
    config = { "\27LJ\2\n¤\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\"<cmd>Telescope prosession<CR>\14<Leader>z\6n\bset\vkeymap\bvim\15prosession\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/vim-prosession",
    url = "https://github.com/dhruvasagar/vim-prosession"
  },
  ["vim-smoothie"] = {
    config = { "\27LJ\2\ny\0\0\2\0\4\1\t6\0\0\0009\0\1\0)\1<\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0K\0\1\0)smoothie_speed_exponentiation_factor!smoothie_speed_linear_factor\6g\bvim\1€€€ÿ\3\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/vim-smoothie",
    url = "https://github.com/psliwka/vim-smoothie"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/vim-which-key",
    url = "https://github.com/liuchengxu/vim-which-key"
  },
  ["vim-yadi"] = {
    config = { "\27LJ\2\nˆ\1\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\2\fcommand\17DetectIndent\fpattern\6*\1\4\0\0\15BufNewFile\16BufReadPost\16BufFilePost\24nvim_create_autocmd\bapi\bvim\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/vim-yadi",
    url = "https://github.com/timakro/vim-yadi"
  },
  winresizer = {
    config = { "\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\v<C-w>e\25winresizer_start_key\6g\bvim\0" },
    loaded = true,
    path = "/home/woynert/.local/share/nvim/site/pack/packer/start/winresizer",
    url = "https://github.com/simeji/winresizer"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n™\2\0\0\5\0\16\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0'\4\15\0B\0\4\1K\0\1\0\26<cmd>AerialToggle<CR>\14<leader>a\6n\bset\vkeymap\bvim\fkeymaps\1\0\1\6o\19actions.scroll\nfloat\1\0\1\rrelative\veditor\vlayout\1\0\2\14placement\tedge\22default_direction\nfloat\1\0\1\16attach_mode\vglobal\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: vim-prosession
time([[Config for vim-prosession]], true)
try_loadstring("\27LJ\2\n¤\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\"<cmd>Telescope prosession<CR>\14<Leader>z\6n\bset\vkeymap\bvim\15prosession\19load_extension\14telescope\frequire\0", "config", "vim-prosession")
time([[Config for vim-prosession]], false)
-- Config for: nerdcommenter
time([[Config for nerdcommenter]], true)
try_loadstring("\27LJ\2\n;\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\30NERDCreateDefaultMappings\6g\bvim\0", "config", "nerdcommenter")
time([[Config for nerdcommenter]], false)
-- Config for: mini.cursorword
time([[Config for mini.cursorword]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ndelay\3È\1\nsetup\20mini.cursorword\frequire\0", "config", "mini.cursorword")
time([[Config for mini.cursorword]], false)
-- Config for: markdown-preview.nvim
time([[Config for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n|\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\rchromium\17mkdp_browser\25mkdp_combine_preview\20mkdp_auto_close\6g\bvim\0", "config", "markdown-preview.nvim")
time([[Config for markdown-preview.nvim]], false)
-- Config for: vim-smoothie
time([[Config for vim-smoothie]], true)
try_loadstring("\27LJ\2\ny\0\0\2\0\4\1\t6\0\0\0009\0\1\0)\1<\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0K\0\1\0)smoothie_speed_exponentiation_factor!smoothie_speed_linear_factor\6g\bvim\1€€€ÿ\3\0", "config", "vim-smoothie")
time([[Config for vim-smoothie]], false)
-- Config for: rainbow-delimiters.nvim
time([[Config for rainbow-delimiters.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\29rainbow-delimiters.setup\frequire\0", "config", "rainbow-delimiters.nvim")
time([[Config for rainbow-delimiters.nvim]], false)
-- Config for: mini.map
time([[Config for mini.map]], true)
try_loadstring("\27LJ\2\n&\0\0\2\0\2\0\0046\0\0\0009\0\1\0B\0\1\1K\0\1\0\vtoggle\fMiniMap¼\2\1\0\b\0\21\1#6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\a\0004\4\4\0009\5\3\0009\5\4\5B\5\1\2>\5\1\0049\5\3\0009\5\5\5B\5\1\2>\5\2\0049\5\3\0009\5\6\5B\5\1\0?\5\0\0=\4\b\0035\4\f\0009\5\t\0009\5\n\5'\a\v\0B\5\2\2=\5\r\4=\4\14\3B\1\2\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\19\0003\5\20\0B\1\4\1K\0\1\0\0\14<leader>m\6n\bset\vkeymap\bvim\fsymbols\vencode\1\0\0\b4x2\bdot\23gen_encode_symbols\17integrations\1\0\0\15diagnostic\rgitsigns\19builtin_search\20gen_integration\nsetup\rmini.map\frequire\a€€À™\4\0", "config", "mini.map")
time([[Config for mini.map]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\nC\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\bcfg\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: vim-yadi
time([[Config for vim-yadi]], true)
try_loadstring("\27LJ\2\nˆ\1\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\2\fcommand\17DetectIndent\fpattern\6*\1\4\0\0\15BufNewFile\16BufReadPost\16BufFilePost\24nvim_create_autocmd\bapi\bvim\0", "config", "vim-yadi")
time([[Config for vim-yadi]], false)
-- Config for: winresizer
time([[Config for winresizer]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\v<C-w>e\25winresizer_start_key\6g\bvim\0", "config", "winresizer")
time([[Config for winresizer]], false)
-- Config for: mini.tabline
time([[Config for mini.tabline]], true)
try_loadstring("\27LJ\2\nz\0\2\a\0\a\0\0176\2\0\0009\2\1\0028\2\0\0029\2\2\2\15\0\2\0X\3\2€'\2\3\0X\3\1€'\2\4\0006\3\5\0009\3\6\3\18\5\0\0\18\6\1\0B\3\3\2\18\4\2\0&\3\4\3L\3\2\0\19default_format\16MiniTabline\5\a+ \rmodified\abo\bvimQ\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\vformat\1\0\0\0\nsetup\17mini.tabline\frequire\0", "config", "mini.tabline")
time([[Config for mini.tabline]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-hl-mdcodeblock.lua ]]

-- Config for: nvim-hl-mdcodeblock.lua
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16minumum_len\3\30\nsetup\19hl-mdcodeblock\frequire\0", "config", "nvim-hl-mdcodeblock.lua")

vim.cmd [[ packadd headlines.nvim ]]

-- Config for: headlines.nvim
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14headlines\frequire\0", "config", "headlines.nvim")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
