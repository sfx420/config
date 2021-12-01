pkgs: with pkgs; ''
    if $TERM!='linux'
      let base16colorspace=256
    endif
    color base16-tomorrow-night
    set background=dark

    filetype plugin indent on
    syntax enable

    set backupdir=~/.local/share/nvim/backup//
    set grepformat^=%f:%l:%c:%m
    set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
    set shortmess+=c
    set t_Co=256

    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()

    lua << EOF
      local paths = ${lib.toLua {
    bin = {
      bash-language-server = "${nodePackages.bash-language-server}/bin/bash-language-server";
      clangd = "${clang-tools}/bin/clangd";
      docker-langserver = "${nodePackages.dockerfile-language-server-nodejs}/bin/docker-langserver";
      elm = "${elmPackages.elm}/bin/elm";
      elm-format = "${elmPackages.elm-format}/bin/elm-format";
      elm-language-server = "${elmPackages.elm-language-server}/bin/elm-language-server";
      elm-test = "${elmPackages.elm-test}/bin/elm-test";
      gopls = "${gopls}/bin/gopls";
      julia = "${julia_16-bin}/bin/julia";
      lua-language-server = "${sumneko-lua-language-server}/bin/lua-language-server";
      omnisharp = "${omnisharp-roslyn}/bin/omnisharp";
      ripgrep = "${ripgrep}/bin/rg";
      rnix-lsp = "${rnix-lsp}/bin/rnix-lsp";
      rust-analyzer = "${rust-analyzer}/bin/rust-analyzer";
    };
    src = {
      lua-language-server = "${sumneko-lua-language-server}";
    };
  }}
      ${lib.fileContents ./config.lua}
    EOF

    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#bufferline#enabled = 1
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#show_splits = 1
    let g:airline#extensions#tabline#tab_min_count = 1
    let g:airline#extensions#tabline#tab_nr_type = 2
    let g:airline#extensions#tagbar#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_theme='base16'

    let g:AutoPairsFlyMode = 0
    let g:AutoPairsShortcutToggle = '<A-p>'

    let g:bufferline_echo = 0

    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

    let g:go_code_completion_enabled = 0
    let g:go_def_mapping_enabled = 0
    let g:go_fmt_autosave = 0
    let g:go_gopls_enabled = 0
    let g:go_highlight_array_whitespace_error = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_chan_whitespace_error = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_trailing_whitespace_error = 1
    let g:go_test_show_name = 1

    let g:NERDCreateDefaultMappings = 0

    let g:rustc_path = '${fenix.complete.rustc}/bin/rustc'
    let g:rust_clip_command = '${wl-clipboard}/bin/wl-copy'

    let g:loaded_netrwPlugin = 1

    let g:markdown_fenced_languages = ['css', 'js=javascript']

    command! -nargs=? -complete=dir Explore Dirvish <args>
    command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
    command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

    au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

    au FileType  markdown              packadd vim-table-mode
    au FileType  typescript            setlocal noexpandtab
''
