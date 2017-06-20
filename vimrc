runtime! debian.vim 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/.vim/bundle')
"
"  let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
"  The following are examples of different formats supported.
"  Keep Plugin commands between vundle#begin/end.
"  plugin on GitHub repo
 Plugin 'tpope/vim-fugitive'
 Plugin 'scrooloose/nerdcommenter'
 Plugin 'scrooloose/nerdtree'
 Plugin 'jiangmiao/auto-pairs'
 Plugin 'scrooloose/syntastic'
 Plugin 'Yggdroot/indentLine'
 Plugin 'vim-airline/vim-airline'
 Plugin 'christoomey/vim-system-copy'
 Plugin 'jaredly/vim-debug'
 Plugin 'rhysd/8cc.vim'
 Plugin 'airblade/vim-gitgutter'
"  All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"  To ignore plugin indent changes, instead use:
" filetype plugin on
" "
"  Brief help
"  :PluginList       - lists configured plugins
"  :PluginInstall    - installs plugins; append `!` to update or just
"  :PluginUpdate
"  :PluginSearch foo - searches for foo; append `!` to refresh local cache
"  :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" 
"  see :h vundle for more details or wiki for FAQ
"  Put your non-Plugin stuff after this line
" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim 

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Set line numbers
set number 

" Set number of tab spaces
set tabstop=4

" Set no swapfile
set noswapfile

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
syntax enable
set background=dark
"let g:solarized_termcolors=256
colorscheme basic-dark
"set t_Co=256

" NERDTreeAutoLoad
"autocmd VimEnter * NERDTree
"Puts cursor in main window
"autocmd VimEnter * wincmd p

"NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

"New tab
map ,t <Esc>:tabnew<CR>

"Tab switch
"previous tab
map <C-p> <Esc>:tabp<CR>
"next tab
map <C-o> <Esc>:tabn<CR>

" Set status bar
set laststatus=2
" tail of the file name
set statusline=%t
" file encoding
"set statusline+=[%{strlen(&fenc)?&fenc:'none'},
" file format
set statusline+=%{&ff}]
" help file flag
set statusline+=%h
" modified flag
set statusline+=%m
" read-only flag
set statusline+=%r
" filetype
set statusline+=%y      
" left/right separator
set statusline+=%=
" cursor column
set statusline+=%c,
" cursor line/total lines
set statusline+=%l/%L
" percent trhough file
set statusline+=\ %P
" bar color
hi StatusLine ctermbg=white ctermfg=black

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Map CapsLock to Escape while in ViM
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" Return normal function to CapsLock and Escape after quitting ViM
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
