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
local package_path_str = "/home/lapinou/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/lapinou/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/lapinou/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/lapinou/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lapinou/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  Comment = {
    config = { 'local _, e = pcall(function() require("plugins.Comment") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/Comment",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  catppuccin = {
    config = { 'local _, e = pcall(function() require("plugins.catppuccin") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    after = { "mason" },
    config = { 'local _, e = pcall(function() require("plugins.coq_nvim") end)' },
    loaded = true,
    only_config = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  feline = {
    config = { 'local _, e = pcall(function() require("plugins.feline") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/feline",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  impatient = {
    config = { 'local _, e = pcall(function() require("plugins.impatient") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/impatient",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline"] = {
    config = { 'local _, e = pcall(function() require("plugins.indent-blankline") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/indent-blankline",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  lightspeed = {
    config = { 'local _, e = pcall(function() require("plugins.lightspeed") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/lightspeed",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_lines.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  mason = {
    config = { 'local _, e = pcall(function() require("plugins.mason") end)' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/opt/mason",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/mason-null-ls.nvim",
    url = "https://github.com/jayp0521/mason-null-ls.nvim"
  },
  ["mason-nvim-dap.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/mason-nvim-dap.nvim",
    url = "https://github.com/jayp0521/mason-nvim-dap.nvim"
  },
  nord = {
    config = { 'local _, e = pcall(function() require("plugins.nord") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/nord",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-base16"] = {
    config = { 'local _, e = pcall(function() require("plugins.nvim-base16") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/nvim-base16",
    url = "https://github.com/RRethy/nvim-base16"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    config = { 'local _, e = pcall(function() require("plugins.nvim-treesitter") end)' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  rooter = {
    config = { 'local _, e = pcall(function() require("plugins.rooter") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/rooter",
    url = "https://github.com/ygm2/rooter.nvim"
  },
  seoul256 = {
    config = { 'local _, e = pcall(function() require("plugins.seoul256") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/seoul256",
    url = "https://github.com/shaunsingh/seoul256.nvim"
  },
  sniprun = {
    config = { 'local _, e = pcall(function() require("plugins.sniprun") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  telescope = {
    config = { 'local _, e = pcall(function() require("plugins.telescope") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/telescope",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-lsp-handlers.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/telescope-lsp-handlers.nvim",
    url = "https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  toggleterm = {
    config = { 'local _, e = pcall(function() require("plugins.toggleterm") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/toggleterm",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  tokyodark = {
    config = { 'local _, e = pcall(function() require("plugins.tokyodark") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/tokyodark",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  tokyonight = {
    config = { 'local _, e = pcall(function() require("plugins.tokyonight") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/tokyonight",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["virtual-types.nvim"] = {
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/virtual-types.nvim",
    url = "https://github.com/jubnzv/virtual-types.nvim"
  },
  ["xresources-nvim"] = {
    config = { 'local _, e = pcall(function() require("plugins.xresources-nvim") end)' },
    loaded = true,
    path = "/home/lapinou/.local/share/nvim/site/pack/packer/start/xresources-nvim",
    url = "https://github.com/nekonako/xresources-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-base16
time([[Config for nvim-base16]], true)
local _, e = pcall(function() require("plugins.nvim-base16") end)
time([[Config for nvim-base16]], false)
-- Config for: toggleterm
time([[Config for toggleterm]], true)
local _, e = pcall(function() require("plugins.toggleterm") end)
time([[Config for toggleterm]], false)
-- Config for: coq_nvim
time([[Config for coq_nvim]], true)
local _, e = pcall(function() require("plugins.coq_nvim") end)
time([[Config for coq_nvim]], false)
-- Config for: Comment
time([[Config for Comment]], true)
local _, e = pcall(function() require("plugins.Comment") end)
time([[Config for Comment]], false)
-- Config for: lightspeed
time([[Config for lightspeed]], true)
local _, e = pcall(function() require("plugins.lightspeed") end)
time([[Config for lightspeed]], false)
-- Config for: indent-blankline
time([[Config for indent-blankline]], true)
local _, e = pcall(function() require("plugins.indent-blankline") end)
time([[Config for indent-blankline]], false)
-- Config for: nord
time([[Config for nord]], true)
local _, e = pcall(function() require("plugins.nord") end)
time([[Config for nord]], false)
-- Config for: feline
time([[Config for feline]], true)
local _, e = pcall(function() require("plugins.feline") end)
time([[Config for feline]], false)
-- Config for: tokyodark
time([[Config for tokyodark]], true)
local _, e = pcall(function() require("plugins.tokyodark") end)
time([[Config for tokyodark]], false)
-- Config for: sniprun
time([[Config for sniprun]], true)
local _, e = pcall(function() require("plugins.sniprun") end)
time([[Config for sniprun]], false)
-- Config for: tokyonight
time([[Config for tokyonight]], true)
local _, e = pcall(function() require("plugins.tokyonight") end)
time([[Config for tokyonight]], false)
-- Config for: telescope
time([[Config for telescope]], true)
local _, e = pcall(function() require("plugins.telescope") end)
time([[Config for telescope]], false)
-- Config for: rooter
time([[Config for rooter]], true)
local _, e = pcall(function() require("plugins.rooter") end)
time([[Config for rooter]], false)
-- Config for: seoul256
time([[Config for seoul256]], true)
local _, e = pcall(function() require("plugins.seoul256") end)
time([[Config for seoul256]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
local _, e = pcall(function() require("plugins.catppuccin") end)
time([[Config for catppuccin]], false)
-- Config for: xresources-nvim
time([[Config for xresources-nvim]], true)
local _, e = pcall(function() require("plugins.xresources-nvim") end)
time([[Config for xresources-nvim]], false)
-- Config for: impatient
time([[Config for impatient]], true)
local _, e = pcall(function() require("plugins.impatient") end)
time([[Config for impatient]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd mason ]]

-- Config for: mason
local _, e = pcall(function() require("plugins.mason") end)

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

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
