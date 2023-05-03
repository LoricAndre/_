# Nushell Environment Config File
#
# version = 0.78.0

def create_left_prompt [] {
    mut home = ""
    try {
        if $nu.os-info.name == "windows" {
            $home = $env.USERPROFILE
        } else {
            $home = $env.HOME
        }
    }

    let dir = ([
        ($env.PWD | str substring 0..($home | str length) | str replace -s $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let path_segment = if (is-admin) {
        $"(ansi red_bold)($dir)"
    } else {
        $"(ansi green_bold)($dir)"
    }

    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str join)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = {|| create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = {|| "> " }
let-env PROMPT_INDICATOR_VI_INSERT = {|| ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
let-env PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
let new_path = ["$env.HOME/.nvm/versions/node/v16.19.0/bin", "$env.HOME/bin", "$env.HOME/.local/bin", "/opt/texlive/2020/bin/x86_64-linux", "$env.HOME/.npm-packages/bin", "/usr/lib/ruby/gems/2.7.0", "$env.HOME/.gem/ruby/2.7.0", "$env.HOME/.cargo/bin", "$env.HOME/.local/share/go/bin"]
for p in $new_path {
  let-env PATH = ($env.PATH | split row (char esep) | prepend $p)
}
let-env BROWSER = 'wsl-open'
let-env EDITOR = 'nvim'
let-env GOPATH = '/home/lapinou/.local/share/go'
let-env LANG = 'en_US.UTF-8'
let-env PAGER = 'bat'
let-env VIMRUNTIME = '/usr/share/nvim/runtime'
let-env VISUAL = 'nvim'
let-env XKB_DEFAULT_LAYOUT = 'fr'
let-env _ = '/usr/sbin/nu'
let-env MOZ_ENABLE_WAYLAND = '1'
let-env NVM_BIN = '/home/lapinou/.nvm/versions/node/v16.19.0/bin'
let-env NVM_CD_FLAGS = '-q'
let-env NVM_DIR = '/home/lapinou/.nvm'
let-env NVM_INC = '/home/lapinou/.nvm/versions/node/v16.19.0/include/node'

source ~/.config/nushell/aliases.nu
