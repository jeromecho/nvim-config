set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouseclick
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set backupcopy=yes          " disable safe write
set ma
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin('~/.vim/plugged')  
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'mxw/vim-jsx'
 Plug 'pangloss/vim-javascript'
 Plug 'NLKNguyen/papercolor-theme'
 Plug 'leafgarland/typescript-vim'
 Plug 'peitalin/vim-jsx-typescript'
 Plug 'mfussenegger/nvim-dap'
 Plug 'w0rp/ale'
 Plug 'digitaltoad/vim-pug'
 Plug 'othree/html5.vim'
 Plug 'rust-lang/rust.vim'
 Plug 'nikvdp/ejs-syntax'
 Plug 'vim-python/python-syntax'
 Plug 'uiiaoo/java-syntax.vim'
call plug#end()

" Enable full functionality of syntax highlighting
syntax enable 
filetype plugin indent on

"html5.vim
"let g:html5_event_handler_attributes_complete = 0
"let g:html5_rdfa_attributes_complete = 0
"let g:html5_microdata_attributes_complete = 0
"let g:html5_aria_attributes_complete = 0

 
 let g:ale_fixers = {
\ 'javascript': ['eslint']
\ }

 let g:ale_fix_on_save = 1
 let g:ale_sign_error = '>>'
 let g:ale_sign_warning = '--'
 let g:ale_echo_msg_error_str = 'E'
 let g:ale_echo_msg_warning_str = 'W'

" mfussengegger/nvim-dap
" ** TODO - below path might BREAK
lua << EOF
local dap = require('dap')
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {'/Applications/Visual Studio Code.app/' .. 'vscode-node-debug2/out/src/nodeDebug.js'},
}
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpoint', {text='🔵', texthl='', linehl='', numhl=''})
EOF

 let g:UltiSnipsExpandTrigger='<tab>'

 " shortcut to go to next position
 let g:UltiSnipsJumpForwardTrigger='<c-j>'

 " shortcut to go to previous position
 let g:UltiSnipsJumpBackwardTrigger='<c-k>'
 let g:UltiSnipsSnippetDirectories=['UltiSnips']

 let g:python_highlight_all = 1

:inoremap ii <Esc>
" auto-complete braces VS-Code style
:inoremap { {}<Left>
:inoremap ( ()<Left>
" auto-complete quotes & template literals
:inoremap ' ''<Left>
:inoremap " ""<Left>
:inoremap ` ``<Left>
:inoremap [ []<Left>
"JSX
:inoremap <html> <html></html><Left><Left><Left><Left><Left><Left><Left>
:inoremap <body> <body></body><Left><Left><Left><Left><Left><Left><Left>
:inoremap <div> <div></div><Left><Left><Left><Left><Left><Left>
:inoremap <p> <p></p><Left><Left><Left><Left>
:inoremap <h1> <h1></h1><Left><Left><Left><Left><Left>
:inoremap <h2> <h2></h2><Left><Left><Left><Left><Left>
:inoremap <h3> <h3></h3><Left><Left><Left><Left><Left>
:inoremap <h4> <h4></h4><Left><Left><Left><Left><Left>
:inoremap <h5> <h5></h5><Left><Left><Left><Left><Left>
:inoremap <a> <a></a><Left><Left><Left><Left>
:inoremap <img> <img src='' /><Left><Left><Left><Left>

"nerdtree
:nnoremap <F2> :NERDTreeToggle<CR>
"html
" DAP 
nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <S-k> :lua require'dap'.step_out()<CR>
nnoremap <S-l> :lua require'dap'.step_into()<CR>
nnoremap <S-j> :lua require'dap'.step_over()<CR>
nnoremap <leader>ds :lua require'dap'.stop()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
nnoremap <leader>dk :lua require'dap'.up()<CR>
nnoremap <leader>dj :lua require'dap'.down()<CR>
nnoremap <leader>d_ :lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>di :lua require'dap'.ui.variables'.hover()<CR>
nnoremap <leader>di :lua require'dap'.ui.variables.visual_hover()<CR>
nnoremap <leader>d? :lua require'dap'.variables'.scopes()<CR>
nnoremap <leader>de :lua require'dap'.set_expectation_breakpoint({"all"})<CR>
nnoremap <leader>da :lua require'debugHelper'.attach()<CR>
nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>
nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR> 
nnoremap <leader>d? :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>

colorscheme PaperColor





