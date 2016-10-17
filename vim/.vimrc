source /home/ale/.local/share/pearl/boot/vim/pearl.vim

"Super-minimal pathogen 
execute pathogen#infect()
syntax on
filetype plugin indent on


" perl 6 plugins long setup

" git clone https://github.com/vim-perl/vim-perl.git ~/.vim/bundle/vim-perl
" git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
" git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim/bundle/vim-airline-themes
" git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
" git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/synastic
" git clone https://github.com/nxadm/syntastic-perl6.git ~/.vim/bundle/synastic-perl6
" git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe


"Enable extra features (e.g. when run systemwide). Must be before pathogen
set nocompatible
"Enable pathogen
"execute pathogen#infect()
"Enable syntax highlighting
"syntax on
"Enable indenting
"filetype plugin indent on

"Set line wrapping
set wrap
set linebreak
set nolist
set formatoptions+=l

"Enable 256 colours
set t_Co=256

"Set auto indenting
set autoindent

"Smart tabbing
set expandtab
set smarttab
set sw=4 " no of spaces for indenting
set ts=4 " show \t as 2 spaces and treat 2 spaces as \t when deleting

"Set title of xterm
set title

" Highlight search terms
set hlsearch

"Strip trailing whitespace for certain type of files
autocmd BufWritePre *.{erb,md,pl,pl6,pm,pm6,pp,rb,t,xml,yaml,go} :%s/\s\+$//e

"Override tab espace for specific languages
autocmd Filetype ruby,puppet setlocal ts=2 sw=2

"Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | 
    \ exe "normal! g'\"" | endif

"Add a coloured right margin for recent vim releases
if v:version >= 703
    set colorcolumn=80
endif

"Autosave when changing buffer or making
set autowrite

"Ubuntu suggestions
set showcmd    " Show (partial) command in status line.
set showmatch  " Show matching brackets.
set ignorecase " Do case insensitive matching
set smartcase  " Do smart case matching
set incsearch  " Incremental search
set autowrite  " Automatically save before commands like :next and :make
set hidden     " Hide buffers when they are abandoned
" Enable mouse usage (all modes).
" Press shift while selecting with the mouse. This will make mouse selection
" behave as if mouse=a was not enabled. This is also valid for middle button
" paste.  On MacOS: hold alt/option.
set mouse=a    

"-----------------------------------------------------------------------------"
"External plugins

"airline statusbar
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
"In order to see the powerline fonts, adapt the font of your terminal
"In Gnome Terminal: "use custom font" in the profile. I use Monospace regular.
let g:airline_powerline_fonts = 1

"markdown support
let g:vim_markdown_folding_disabled=1

"syntastic syntax checking
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"Language specific configuration
"Disable false positives for erb files
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
let g:syntastic_puppet_checkers = [] "skip lint for puppet as it make vim slow
let g:syntastic_go_checkers = []     "idem
let g:syntastic_perl6_checkers = [ 'perl6latest']
"let g:syntastic_perl6_lib_path = [ '/home/claudio/Code/OpenLDAP-DataConsistency/lib', 'boo', 'bah' ]
let g:syntastic_enable_perl6latest_checker = 1
let g:syntastic_enable_perl_checker = 1
"let g:syntastic_perl6_interpreter = '/home/claudio/bin/perl6'
