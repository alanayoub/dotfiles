call plug#begin('~/.vim/plugged')

  " Theme
  Plug 'dracula/vim'
  Plug 'morhetz/gruvbox'

  " Comments
  Plug 'preservim/nerdcommenter'

  " Rainbow Parentheses
  Plug 'kien/rainbow_parentheses.vim'

  " Language Client
  " https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions<Paste>
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = [
  \ 'coc-actions',
  \ 'coc-bookmark',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-git',
  \ 'coc-highlight',
  \ 'coc-svg',
  \ 'coc-lists',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-suggest',
  \ 'coc-diagnostic',
  \ 'coc-signature'
  \ ]

  " Start screen
  Plug 'mhinz/vim-startify'

  " Snippits
  Plug 'SirVer/ultisnips'

  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  " linters
  Plug 'w0rp/ale'

  " status
  Plug 'vim-airline/vim-airline'

  " Indent Guides
  " Plug 'nathanaelkane/vim-indent-guides'

  "helpers
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'

  " File Explorer with Icons
  Plug 'scrooloose/nerdtree'
  "Plug 'ryanoasis/vim-devicons'

  " git
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'

  " File Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Vim / Tmux Navigation
  Plug 'christoomey/vim-tmux-navigator'

call plug#end()



""
"" Theme
""

" syntax enable
" colorscheme dracula
autocmd vimenter * colorscheme gruvbox
" set background=light
" let g:gruvbox_contrast_light=hard

"" Character limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/



""
"" Indent Guides
""
" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_auto_colors = 0
" hi IndentGuidesOdd  ctermbg=red
" hi IndentGuidesEven ctermbg=green



""
"" Nerdtree
""

"" NERDTree
let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['\.vim$', '\~$']
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NerdTree
map <F2> :NERDTreeToggle<CR>



""
"" Comments
""

" needed for nerdcommenter
filetype plugin on

" use f to toggle comments via NERDCommenter
map f <Leader>c<Space>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1



""
"" Bookmarks
""
nmap <Leader>bm <Plug>(coc-bookmark-toggle)
nmap <Leader>bn <Plug>(coc-bookmark-next)
nmap <Leader>bp <Plug>(coc-bookmark-prev)



""
"" General
""

set tabstop=2
set expandtab
set shiftwidth=2
set encoding=utf-8
set number              " Line numbers
set foldmethod=manual
set splitright
set splitbelow
set cmdheight=2         " Give more space for displaying messages
set updatetime=300      " Having longer updatetime (default is 4000 ms) leads to noticeable delays and poor user experience
set signcolumn="yes:2"
set hidden              " Allow vim to abandon a buffer when editing another one
set shortmess+=c
set relativenumber

"" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Set cursorline
set cursorline
hi CursorLine   cterm=NONE ctermbg=DarkGrey guibg=DarkGrey

" Toggle relative line numbers on when cursor in file
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END



""
"" Snippits
""

let g:UltiSnipsListSnippets="<f3>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



""
"" Linting
""

let g:ale_enabled = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_set_signs = 1
let g:ale_virtualtext_cursor = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '🛑'
let g:ale_sign_warning = '⚠️'
let g:ale_set_highlights = 1
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
let g:ale_linters = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint']
\ }



""
"" Fixers
""

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'css': ['prettier', 'stylelint'],
  \ 'javascript': ['eslint', 'prettier'],
  \ 'typescript': ['eslint', 'prettier'],
  \ 'python': ['isort', 'black'],
  \ 'HTML': ['HTMLHint', 'proselint'],
  \ 'go': ['gofmt'],
  \ 'ruby': ['rubocop'],
\ }
let g:ale_fix_on_save = 1



""
"" Rainbow Parentheses
""

let g:rbpt_colorpairs = [
  \ ['brown',       'RoyalBlue3'],
  \ ['Darkblue',    'SeaGreen3'],
  \ ['darkgray',    'DarkOrchid3'],
  \ ['darkgreen',   'firebrick3'],
  \ ['darkcyan',    'RoyalBlue3'],
  \ ['darkred',     'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['brown',       'firebrick3'],
  \ ['gray',        'RoyalBlue3'],
  \ ['black',       'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['Darkblue',    'firebrick3'],
  \ ['darkgreen',   'RoyalBlue3'],
  \ ['darkcyan',    'SeaGreen3'],
  \ ['darkred',     'DarkOrchid3'],
  \ ['red',         'firebrick3'],
\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Currently off. Uncomment to turn on by default
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces



""
"" Navigation
""

"" tab navigation like firefox
nnoremap <C-right> :tabn<cr>
nnoremap <C-left> :tabp<cr>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>

"" Tmux navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-p> :TmuxNavigatePrevious<cr>

"" Pane navigation
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l



""
"" Terminal
""

"" turn terminal to normal mode with escape
nnoremap <c-n> :call OpenTerminal()<CR>
tnoremap <Esc> <C-\><C-n>

"" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

"" open terminal on ctrl+;
"" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction



""
"" Competion
""

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif



""
"" Documentation
""

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction



""
"" fzf - Command-line fuzzy finder
""

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
\ }
