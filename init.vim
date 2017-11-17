" Stolen from Braden: https://raw.githubusercontent.com/bradens/dotfiles/master/init.vim
" Vim Basics
" ==========
set nocompatible
set t_Co=256
set modelines=0

" Enable vim-plug
" ===============
call plug#begin()

" Plugins
" =======

" VCS
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'airblade/vim-gitgutter'
"Plug 'bruno-/vim-husk'
"
"" System
"Plug 'Valloric/YouCompleteMe'
"Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'moll/vim-bbye'
"Plug 'SirVer/ultisnips'
Plug 'mileszs/ack.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
"
"" Plain Text
"Plug 'reedes/vim-pencil', {'for': ['text']}
Plug 'junegunn/goyo.vim', {'for': ['text', 'markdown']}
"Plug 'amix/vim-zenroom2', {'for': ['text']}
Plug 'vim-scripts/loremipsum'
"
"" Syntaxes
Plug 'othree/html5.vim', {'for': ['html']}
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html']}
Plug 'kchmck/vim-coffee-script', {'for': ['coffee']}
Plug 'toadums/vim-cjsx', {'for': ['coffee']}
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'haml']}
Plug 'mxw/vim-jsx', {'for': ['javascript']}
Plug 'cakebaker/scss-syntax.vim', {'for': ['scss', 'sass', 'haml']}
"Plug 'digitaltoad/vim-jade'
" Plug 'godlygeek/tabular'
"
" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'tpope/vim-rake', {'for': 'ruby'}
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-endwise', {'for': 'ruby'}

" Themes
Plug 'flazz/vim-colorschemes'
Plug 'clinstid/eink.vim'

Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'

Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'blueyed/vim-diminactive'
" Plug 'wincent/command-t'
"
" Use this version of vim-autoclose as the main one
" (https://github.com/Townk/vim-autoclose) breaks abbreviations.
Plug 'jmjohnson/vim-autoclose'

" I find I have to put this at the end or else my syntax highlighting for TODO
" gets overwritten.
" Plug 'spatten/vim-markdown', {'for': 'markdown'}
Plug '~/code/vim/vim-markdown', {'for': 'markdown'}

" ctag support
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'

" End vim-plug
" ============
call plug#end()
"
" Display Settings
" ================
syntax enable

" Disable Background Color Erase (tmux)
" ====================================
if &term =~ '256color'
  set t_ut=
endif

if has('nvim')
  nmap <bs> <c-w>h
endif

" Disable netrw
"let g:loaded_netrw       = 1
"let g:loaded_netrwPlugin = 1
"
" General Config
" ==============
let mapleader=' '
let maplocalleader='\\'
set number                      " Line numbers are good
"set relativenumber
"set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
"set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set laststatus=2                " Always show status line
set clipboard=unnamed           " Use system clipboard
set hidden                      " Buffers can exist in the background
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window
"set re=1                        " Uses the first regex version, major speedup
"let g:jsx_ext_required = 0      " Allow JSX in normal JS file
let g:diminactive_enable_focus = 1
" let g:diminactive_use_syntax = 1
"
"
" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" Show trailing whitepace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" Turn on spelling for markdown and txt files
" autocmd BufNewFile,BufRead *.md,*.txt :setlocal spell spelllang=en_us

" EasyTags setup (https://peterodding.com/code/vim/easytags/)
" let g:easytags_async = 1
" let g:easytags_always_enabled = 0
" let g:easytags_autorecurse = 0

"" Mouse
"" ======
"set mouse=a " Enable mouse use in all modes
"
" Search Settings
" ===============
set ignorecase
set smartcase
set incsearch        " Find the next match as we type the search
set showmatch
set hlsearch         " Hilight searches by default
set viminfo='100,f1  " Save up to 100 marks, enable capital marks

" Indentation and Display
" =======================
filetype plugin on
filetype indent on
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set shiftround "round indent level to 2
set tabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
set colorcolumn=                    " Don't show a marker
set wrap                            " wrap lines
set linebreak                         " Wrap lines at convenient points
set ttyfast
set lazyredraw
set ruler

" Turn Off Swap Files
" ===================
set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" UltiSnips
"" =========
"let g:UltiSnipsExpandTrigger="<C-v>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsEditSplit="vertical"
"
"" Folds
"" =====
"set foldmethod=indent   " Fold based on indent
"set foldnestmax=3       " Deepest fold is 3 levels
"set nofoldenable        " Don't fold by default

" Completion
" ==========
set wildmenu
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl,*.sw?,*.DS_Store,*.luac,*.pyc,**.class
set wildignore+=bower_components,node_modules,vendor/bundle,public

" Scrolling
" =========
" Start scrolling when we're getting close to margins
set scrolloff=3
" set sidescrolloff=15
" set sidescroll=1

" Disable Arrow Keys
" ==================
imap <down>  <nop>
imap <left>  <nop>
imap <right> <nop>
imap <up>    <nop>
map  <down>  <nop>
map  <left>  <nop>
map  <right> <nop>
map  <up>    <nop>

" set noesckeys
set ttimeout
set ttimeoutlen=1

" hit jk quickly instead of <Escape>
imap jk <Esc>
cmap jk <Esc>
vmap jk <Esc>
" how long you have to type that second key, in ms
set timeoutlen=300

" Easier start & end of line.
noremap H ^
nnoremap L $
vnoremap L $h
"
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Surround in triple-tildes in Markdown
" V(make selection)S`
autocmd FileType markdown let b:surround_126 = "~~~\r~~~"

" Selection
" ==========
"
" select all
map <Leader>a ggVG
"
" Yank from cursor to end of line
"nnoremap Y y$

" Select the text that was last edited/pasted.
" http://vimcasts.org/episodes/bubbling-text/
"nmap gV `[v`]
"
"" Visual find/replace
"vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
"
"" Remove whitespace
"map <Leader>W :%s/\s\+$//e<CR>
"
"" Reselect visual block after indent/outdent
"vnoremap < <gv
"vnoremap > >gv
"
"" Clear last search
"nnoremap <space> :set hlsearch! hlsearch?<CR>
"
"" Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap w!! %!sudo tee > /dev/null %
"
"" Add some other bindings from files to languages
autocmd! BufRead,BufNewFile *.jbuilder,Gemfile,Rakefile,Procfile,Guardfile setf ruby
au BufRead,BufNewFile *.thor set filetype=ruby
"au BufRead,BufNewFile Guardfile set filetype=ruby
"au BufRead,BufNewFile */nginx/*.conf set filetype=nginx
"au BufRead,BufNewFile *.jbuilder setf ruby
"au BufRead,BufNewFile *.jeco setf html
"au BufRead,BufNewFile *.jss set filetype=css
"au BufRead,BufNewFile *.hbs set filetype=mustache
au BufRead,BufNewFile *.md set filetype=markdown
autocmd! BufWritePost,BufEnter * Neomake
"
"" linters
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:neomake_javascript_enabled_makers = ['eslint']
"
"" Colorscheme
"" ===========
"let g:hybrid_use_Xresources = 1
"let base16colorspace=256
"silent! colorscheme Tomorrow-Night
"set background=dark
colorscheme solarized

" silent! colorscheme Tomorrow
set background=light

" Airline
" =======
" let g:airline_powerline_fonts = 0
" let g:airline_theme = 'bubblegum'
" let g:airline_theme = 'tomorrow'
" let g:airline_theme = 'eighties'
" let g:airline_theme = 'solarized'
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"
" let g:airline#enable#branch = 1
"
" Tmuxline
" ========
let g:tmuxline_powerline_separators = 0

" Git Gutter
" ==========
let g:gitgutter_sign_column_always = 1
let g:gitgutter_eager = 0

" Don't show any border for vertical splits
highlight VertSplit cterm=NONE
"set fillchars+=vert:\ " This comment is here to make the space stay
"hi VertSplit ctermbg=NONE guibg=NONE
"
" Searching
" ==========
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,max:40'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_user_command = 'ag %s -l -g ""'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " Use ag in CtrlP
  let g:ctrlp_use_caching = 0 " Ag is fast enough that CtrlP doesn't need cache
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" turn off current search highlighting with '\'
nnoremap \ :noh<CR>

" Edit and source the init.vim file
nnoremap <Leader>ev :edit $MYVIMRC<cr>
nnoremap <Leader>sv :so $MYVIMRC<cr>

" Go to Leanpub
nnoremap <Leader>el :edit ~lpub/Gemfile<cr>
nnoremap <Leader>ep :edit ~pubcoin/Gemfile<cr>

" bind \ (backward slash) to grep shortcut
" nnoremap \ :Ag<SPACE>

" default to the current file's directory when opening a new file
set autochdir

" Move lines up and down
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" put blank lines above and below current line
nnoremap <A-o> o<Esc>kO<Esc>j



" Folding
" toggle fold on next line
nnoremap zs jzak

" Open my current work-log
nnoremap <Leader>ew :execute "edit " . split(globpath('~/Dropbox/work-logs', '20*.md'), '\n')[-1]<CR>
" Open or Create a new work-log with today's date
:nnoremap <Leader>nw :execute "vsplit" . strftime("~/Dropbox/work-logs/%Y-%m-%d.md")<CR>

" Rust
"" ====
"let g:rust_recommended_style = 0
"
"" Nerdtree overrides
":autocmd FileType nerdtree nmap <buffer><C-j> :TmuxNavigateDown<CR>
":autocmd FileType nerdtree nmap <buffer><C-k> :TmuxNavigateUp<CR>
"
"" Don't let nerdtree open by default when opening a folder.
"let g:NERDTreeHijackNetrw=0
"let NERDTreeShowHidden=1
"
"" Keybindings
"" ===========
"nnoremap <leader>n  :NERDTreeToggle<CR>
"nnoremap <leader>s  :w<CR>
"ino jk <esc>
"cno jk <esc>
"vno v <esc>
"
"" Easier start & end of line.
"noremap H ^
"nnoremap L $
"vnoremap L $h
"
"" Jump to the next linter error
"nnoremap <leader>e :ll<CR>
"
"" easily kill the current buffer
"nnoremap <leader>k  :Bdelete<CR>
"nnoremap <leader>K  :bd<CR>
"nnoremap <leader>d :vsp %:h/
"nnoremap <leader>` :NERDTreeFind<CR>
"
" Use ; instead of : to start commands
nnoremap ; :

" Nicer fold text
" from http://vim.wikia.com/wiki/Customize_text_for_closed_folds

" set foldtext=MyFoldText()
" function! MyFoldText()
"   let line = getline(v:foldstart)
"   if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
"     let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
"     let linenum = v:foldstart + 1
"     while linenum < v:foldend
"       let line = getline( linenum )
"       let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
"       if comment_content != ''
"         break
"       endif
"       let linenum = linenum + 1
"     endwhile
"     let sub = initial . ' ' . comment_content
"   else
"     let sub = line
"     let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
"     if startbrace == '{'
"       let line = getline(v:foldend)
"       let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
"       if endbrace == '}'
"         let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
"       endif
"     endif
"   endif
"   let n = v:foldend - v:foldstart + 1
"   let info = " " . n . " lines"
"   let sub = sub . "                                                                                                                  "
"   let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
"   let fold_w = getwinvar( 0, '&foldcolumn' )
"   let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
"   return sub . info
" endfunction

highlight FoldColumn  gui=bold    guifg=grey65     guibg=Grey90
highlight Folded      gui=italic  guifg=Black      guibg=Grey90
highlight LineNr      gui=NONE    guifg=grey60     guibg=Grey90

" Override Nerdtree mappings for ctrl-J and ctrl-K
let g:NERDTreeMapJumpPrevSibling = '<F1>'
let g:NERDTreeMapJumpNextSibling = '<F2>'

" Abbreviations and typos
iab teh the
iab waht what
iab adn and
