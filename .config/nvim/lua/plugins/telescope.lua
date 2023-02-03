local nmap = require 'utils'.nmap
local telescope = require 'telescope'
local builtin = require 'telescope.builtin'

function _telescope_files()
  if not pcall(builtin.git_files) then
    builtin.find_files()
  end
end

nmap { '<leader>f', _telescope_files }
nmap { '<leader>F', telescope.extensions.file_browser.file_browser }
nmap { '<leader>a', builtin.live_grep }
nmap { '<leader>b', builtin.buffers }
nmap { '<leader>L', builtin.loclist }
nmap { '<leader>q', builtin.quickfix }

telescope.load_extension('lsp_handlers')
telescope.load_extension('media_files')
telescope.load_extension('file_browser')
telescope.load_extension('ui-select')
