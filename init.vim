call plug#begin('~/.vim/plugged')

  " Theme
  Plug 'dracula/vim'

  " Language Client
  " https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions<Paste>
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-actions', 'coc-bookmark', 'coc-emmet', 'coc-eslint', 'coc-git', 'coc-highlight', 'coc-snippets', 'coc-svg', 'coc-lists', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-suggest', 'coc-diagnostic', 'coc-signature']

  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  " syntax helpers
  " Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  " Plug 'jparise/vim-graphql'

  " linters
  Plug 'w0rp/ale'

  " status
  Plug 'vim-airline/vim-airline'

  "helpers
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'airblade/vim-gitgutter'

  " File Explorer with Icons
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'

  " git
  Plug 'itchyny/vim-gitbranch'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'

  " File Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Vim / Tmux Navigation
  Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme dracula

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set tabstop=2
set shiftwidth=2
set expandtab
set encoding=utf-8
set number " Line numbers
set foldmethod=manual
set splitright
set splitbelow
set cmdheight=3 " Give more space for displaying messages
set updatetime=300 " Having longer updatetime (default is 4000 ms) leads to noticeable delays and poor user experience

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['\.vim$', '\~$']
let g:NERDTreeStatusline = ''

" Linting
let g:airline#extensions#ale#enabled = 1 " Errors in status bar
" let g:ale_sign_column_always = 1
let g:ale_set_signs = 1
let g:ale_set_highlights = 1
let g:ale_echo_cursor = 0
let g:ale_virtualtext_cursor = 1
let g:ale_cursor_detail = 0
" let g:ale_set_balloons = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_enter = 0
" let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'css': ['prettier', 'stylelint'],
  \ 'javascript': ['eslint'],
  \}
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Set leader
let mapleader = ","

map <F2> :NERDTreeToggle<CR>

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>

" tab navigation like firefox
nnoremap <C-right> :tabn<cr>
nnoremap <C-left> :tabp<cr>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

nnoremap <c-n> :call OpenTerminal()<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Character limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction



" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Tmux navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-p> :TmuxNavigatePrevious<cr>
