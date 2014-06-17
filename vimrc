" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""""""""""""""""""""""""""""""""""""""""""
" Vundle Config                            
""""""""""""""""""""""""""""""""""""""""""""
Bundle 'scrooloose/nerdtree'
Bundle 'nanotech/jellybeans.vim'
Bundle 'https://github.com/Lokaltog/vim-distinguished'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'https://github.com/skammer/vim-css-color.git'
Bundle 'https://github.com/tpope/vim-surround.git'
Bundle 'https://github.com/scrooloose/nerdcommenter.git'
Bundle 'https://github.com/tpope/vim-fugitive.git'
Bundle 'https://github.com/nono/vim-handlebars.git'

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=100		" keep 100 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


""""""""""""""""""""""""""""""""""""""""""""
" Themes/colours
""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
syntax on
set background=dark
colorscheme jellybeans
"colorscheme distinguished

""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree
""""""""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""
" Spaces and Tabs
""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set expandtab

set number " Line numbers

set foldmethod=marker " Folding stuff

filetype plugin on " needed for nerdcommenter

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-Insert> :tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>


""""""""""""""""""""""""""""""""""""""""""""
" Character limit
""""""""""""""""""""""""""""""""""""""""""""
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/
