set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/share/vim/vim80
call plug#begin()

"call vundle#begin()

"let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'wting/gitsessions.vim'
Plug 'dense-analysis/ale'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdtree'
Plug 'yegappan/mru'
Plug 'tpope/vim-fugitive'
Plug 'fisadev/vim-isort'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'vim-airline/vim-airline'
Plug 'burnettk/vim-angular'
Plug 'Chiel92/vim-autoformat'
Plug 'rust-lang/rust.vim'
Plug 'cfsalguero/perl-go-to-def'
Plug 'SirVer/ultisnips'
Plug 'buoto/gotests-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'uarun/vim-protobuf'


if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif

"call vundle#end() " required
call plug#end()

filetype plugin indent on " required
syntax on
" Set path to let neovim find colors
set rtp+=~/.vim
" Send more characters for redraws
"set ttyfast
"
" Enable mouse use in all modes
set mouse=
"
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
"set ttymouse=xterm2

"set autoread
" au FocusGained,BufEnter * :checktime
" au CursorHold,CursorHoldI * checktime

set undofile " Maintain undo history between sessions
"set undodir=~/.vim/undodir

set completeopt=longest,menuone
set showtabline=2
set path=.,,**
" Case sentive search only if the search word has an upppercase letter
" Both ignorecase and smartcase must be on to make this feature work
set ignorecase
set smartcase
" Auto write the files before make (for vim-go)
set autowrite 
:let mapleader = ","
" Width for word wrap
:set textwidth=152
:set synmaxcol=256

let g:autoformat_verbosemode=1
let g:formatdef_perltidy='"perltidy --perl-best-practices -l=120 -ce -lp -pt=2"'

let g:Show_diagnostics_ui = 1 "default 1

let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goformat"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 0
let g:go_highlight_types = 1
let g:go_textobj_include_function_doc = 1
let g:go_term_enabled = 0
let g:go_list_type = "locationlist"
"let g:go_list_type = "quickfix"
" Show function params in the status line
"let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1
let g:rustfmt_autosave = 1

let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }

let g:ale_linters = {
\   'go': ['gopls', 'go build', 'golangci-lint'],
\   'perl': ['perl', 'perlcritic'],
\   'proto': ['prototool'],
\   'rust': ['analyzer'],
\}

" let g:ale_fix_on_save = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 1
" Don't run w0rp/ale on file open
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1
"let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_text_changed = 0
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_go_golangci_lint_package=1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"air-line
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize=50
"
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>i <Plug>(go-info)

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.ts set filetype=javascript
let g:markdown_fenced_languages = ['javascript', 'go', 'php']

:let g:session_autosave = 'yes'
" To speed up GitSessions
set ssop-=options    " do not store global and local values in a session
"set ssop-=folds     " do not store folds

set number
set t_Co=256
set background=dark
set tabstop=4 
set shiftwidth=4
set virtualedit=all                       
set backspace=2
set nocompatible
set nowrap
set cursorline
set syntax=sh
set showmatch
set autoindent
set expandtab
set history=150
set formatoptions=tcql
set nostartofline
set laststatus=2
set hlsearch
set foldmethod=manual
set foldlevelstart=20

colorscheme hybrid

hi CursorLine term=none cterm=none ctermbg=Black
hi TabLineFill ctermfg=White ctermbg=DarkGrey
hi TabLine term=none cterm=none ctermfg=White ctermbg=DarkGrey
hi TabLineSel term=none cterm=none ctermfg=White ctermbg=Blue
" Overriden by airline
"set statusline=%F%m%r%h%w\ \ \ [FORMAT=%{&ff}]\ [TYPE=%Y]\ \ \ \ \ \ \ \ [POS=%4l,%4v]\ \ \ \ \ \ [%p%%]\ [LEN=%L] 
"
" Mappings for Solaris
"set <F3>=OR
"set <F4>=[[D
"set <F5>=[[E
"set <F6>=[17~
"set <F7>=[18~
"set <F8>=[19~
"set <F9>=[20~
"set <F10>=[21~
"set <s-F2>=[24~
"set <s-F4>=O1;2S
"set <Del>=[3~
"set <C-u>=
"set <PageUp>=[5~
"set <PageDown>=[6~
"set <Home>=[1~
"set <End>=[4~
"set <Insert>=[2~

map <C-n>         :NERDTreeToggle<CR>
map <C-Right>     <Esc>:tabnext<CR>
map <C-Left>      <Esc>:tabprevious<CR>
map <C-Down>      <Esc><C-w><Down>
map <C-Up>        <Esc><C-w><Up>
map <C-S-Down>    :lnext<CR>
map <C-S-Up>      :lprevious<CR>
map <C-A-Left>    <Esc>:tabm -1<CR>
map <C-A-Right>   <Esc>:tabm +1<CR>
nnoremap <silent> ,<space> :nohlsearch<CR>
nnoremap <silent> <leader>fp :echo expand('%:p')<CR>

" :w!! will write read only files not opened with sudo
cmap w!! w !sudo tee % >/dev/null

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

