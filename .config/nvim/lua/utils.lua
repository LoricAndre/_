local M = {}

local map = function(mode, a)
  local lhs = a[1]
  local rhs = a[2]
  local opts = {
    noremap = true,
    silent = true
  }
  if a.noremap ~= nil then
    opts.noremap = a.noremap
  end
  if a.silent ~= nil then
    opts.silent = a.silent
  end
  if a.expr ~= nil then
    opts.expr = a.expr
  end
  if a.nowait ~= nil then
    opts.nowait = a.nowait
  end
  if type(rhs) == 'function' then
    opts.callback = rhs
    rhs = ''
  end
  if a.buffer then
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

M.nmap = function(a)
  map('n', a)
end
M.tmap = function(a)
  map('t', a)
end
M.imap = function(a)
  map('i', a)
end
M.vmap = function(a)
  map('v', a)
end

local get_package_name = function(s)
  local rhs = s:gsub("^(.+)/.+$", "%1")
  local lhs = s:gsub("^.+/(.+)$", "%1")
  if lhs == "nvim" then -- package name from uri 'xxx/nvim'
    return rhs
  end
  -- package name from uri 'xxx/yyy.nvim' or 'xxx/yyy'
  return lhs:gsub("^(.+)%.nvim$", "%1")
end

M.pack = function(a)
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path
    })
  end

  if not pcall(require, 'packer') then
    return
  end

  return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    for k, v in pairs(a) do
      local uri
      if type(k) == 'string' then
        uri = k
      elseif type(v[1]) == 'string' then
        uri = v[1]
      elseif type(k) == 'number' then
        uri = v
      else
        print(k, type(k))
        error("Invalid package spec. Package name must bey the key or the first element", 1)
      end
      local pkg = v
      if type(v) == 'string' then
        pkg = { v }
      end
      pkg[1] = pkg[1] or uri
      pkg.as = pkg.as or get_package_name(uri)
      pkg.config = pkg.config or string.format('local _, e = pcall(function() require("plugins.%s") end)', pkg.as)
      -- print(vim.inspect(pkg))
      use(pkg)
    end
  end)
end

return M
