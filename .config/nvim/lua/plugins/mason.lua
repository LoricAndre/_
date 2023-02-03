local vim = vim
local coq = require 'coq'

local nmap = require 'utils'.nmap
local vmap = require 'utils'.vmap


local ensure_installed = {
  lsp = {
    'sumneko_lua',
    'bashls',
    'pyright',
    'clangd',
    'rust_analyzer',
    'gopls',
    'tsserver',
    'jdtls'
  },
  dap = {
    'python',
    'cppdbg',
    'codelldb',
    'bash',
    'javadbg',
    'node2'
  },
  null_ls = {
    'cpplint',
    'clang_format',
    'hadolint',
    'gitlint',
    'prettierd',
    'prettier',
    'eslint_d',
    'jq',
    'luacheck',
    'markdownlint',
    'autopep8',
    'pylint',
    'shellcheck',
    'shellharden',
    'yamlfmt'
  }
}



local config = {
  lsp = {
    on_attach = function()
      require 'virtualtypes'.on_attach()
      nmap { 'K', vim.lsp.buf.hover }
      nmap { '<leader>ld', vim.lsp.buf.definition }
      nmap { '<leader>lD', vim.lsp.buf.declaration }
      nmap { '<leader>li', vim.lsp.buf.implementation }
      nmap { '<leader>lt', vim.lsp.buf.type_definition }
      nmap { '<leader>lr', vim.lsp.buf.references }
      nmap { '<leader>lR', vim.lsp.buf.rename }
      nmap { '<leader>ls', vim.lsp.buf.document_symbol }
      nmap { '<leader>lS', vim.lsp.buf.workspace_symbol }
      nmap { '<leader>la', vim.lsp.buf.code_action }
      vmap { '<leader>la', vim.lsp.buf.code_action }
      nmap { '<leader>lf', function() vim.lsp.buf.format { async = true } end }
      vmap { '<leader>lf', function() vim.lsp.buf.format { async = true } end }
    end,
    capabilities = vim.lsp.protocol.make_client_capabilities()
  },
  dap = {
    setup = function()
      vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
      nmap { '<F5>', function()
        vim.g.last_dbg_buf = vim.api.nvim_get_current_buf()
        require 'dapui'.open()
        require 'dap'.continue()
      end }

      nmap { '<F17>', function()
        vim.api.nvim_set_current_buf(vim.g.last_dbg_buf)
        require 'dapui'.close()
        require 'dap'.terminate()
      end }
      nmap { '<F6>', require 'dap'.toggle_breakpoint }
      nmap { '<F7>', require 'dap'.step_over }
      nmap { '<F8>', require 'dap'.step_into }

      require 'dapui'.setup()
    end
  }
}

require 'mason'.setup {
  install_root_dir = vim.fn.stdpath('data') .. '/mason/'
}

-- LSP
require 'mason-lspconfig'.setup {
  ensure_installed = ensure_installed.lsp,
  automatic_installation = true
}
require 'mason-lspconfig'.setup_handlers {
  function(server)
    require 'lspconfig'[server].setup(coq.lsp_ensure_capabilities {
      on_attach = config.lsp.on_attach,
      capabilities = config.lsp.capabilities
    })
  end
}

-- DAP
config.dap.setup()
require 'mason-nvim-dap'.setup {
  ensure_installed = ensure_installed.dap,
  automatic_setup = true,
  automatic_installation = true
}
require 'mason-nvim-dap'.setup_handlers()

-- NULL LS
require 'mason-null-ls'.setup {
  ensure_installed = ensure_installed.null_ls,
  automatic_setup = true,
  automatic_installation = true
}
require 'null-ls'.setup()
require 'mason-null-ls'.setup_handlers()
