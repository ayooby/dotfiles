set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'mileszs/ack.vim'
Plugin 'valloric/youcompleteme'
Plugin 'raimondi/delimitmate'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'pangloss/vim-javascript'
Plugin 'junegunn/seoul256.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-surround'
Plugin 'glench/vim-jinja2-syntax'
Plugin 'kylef/apiblueprint.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'othree/html5.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'othree/javascript-syntax.vim'
Plugin 'w0rp/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'peterhurford/send.vim'
Plugin 'joom/vim-commentary'
Plugin 'junegunn/fzf.vim'

set rtp+=/usr/local/opt/fzf
call vundle#end()
filetype plugin indent on
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


let g:vim_jsx_pretty_colorful_config=1

if $SHELL =~ "fish"
  set shell=/bin/bash
endif

set clipboard+=unnamed

" make mouse for mouse resize
set mouse=n

execute pathogen#infect()
syntax on
filetype plugin indent on

au Filetype html,xml,xsl,hbs source ~/.vim/scripts/closetag.vim

let mapleader = ","

" Appearance
set background=dark
set fillchars=
let g:seoul256_background = 235
colo seoul256


" Hide all those pesky pyc files
let NERDTreeIgnore = ['\.pyc$']

" statusline
set laststatus=2
set statusline=
set statusline+=%f
set statusline+=%{fugitive#statusline()}
set statusline+=[line\ %l\/%L]

hi StatusLine ctermbg=darkyellow ctermfg=black
hi StatusLineNC ctermbg=black ctermfg=bg

" Automatically toggle paste mode
" when pasting from clipboard
imap <D-V> ^O"+p

" No beeping.
set visualbell

" Font change
set guifont=Hack:h17

" NERDTree key
map <leader>nn :NERDTreeToggle<CR>


" Fuzzy short cuts
nmap ; :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>r :Tags<CR>

" Remap dash to colon, because it's quicker
nnoremap - :

" Toggle to next window
nnoremap <leader>w <C-w>w

nmap <C-J> <C-W><C-J>
nmap <C-L> <C-W><C-L>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>

" Re-select text that was just pasted
" to perform stuff like indentation
" nnoremap <leader>v V`]
inoremap jj <Esc>

" sanity
set number
set relativenumber             " Show relative line numbers
set encoding=utf-8
set nocompatible
set backspace=2
set ruler
set scrolloff=3
set cursorline
set ttyfast

" don't redraw when don't have to
set lazyredraw

" Tabs, whitespace and friends
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set linespace=11


" Invisibles
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
set list
set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:•

" Allow file undo after close
set undofile

" Searching and stuff
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" Pastetoggle
set pastetoggle=<leader>v

" Enable spell checking for markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"show tab numbers
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
        let s = '' " complete tabline goes here
        " loop through each tab page
        for t in range(tabpagenr('$'))
                " set highlight
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " set the tab page number (for mouse clicks)
                let s .= '%' . (t + 1) . 'T'
                let s .= ' '
                " set page number string
                let s .= t + 1 . ' '
                " get buffer names and statuses
                let n = ''      "temp string for buffer names while we loop and check buftype
                let m = 0       " &modified counter
                let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(t + 1)
                        " buffer types: quickfix gets a [Q], help gets [H]{base fname}
                        " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
                        if getbufvar( b, "&buftype" ) == 'help'
                                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                        elseif getbufvar( b, "&buftype" ) == 'quickfix'
                                let n .= '[Q]'
                        else
                                let n .= pathshorten(bufname(b))
                        endif
                        " check and ++ tab's &modified count
                        if getbufvar( b, "&modified" )
                                let m += 1
                        endif
                        " no final ' ' added...formatting looks better done later
                        if bc > 1
                                let n .= ' '
                        endif
                        let bc -= 1
                endfor
                " add modified label [n+] where n pages in tab are modified
                if m > 0
                        let s .= '[' . m . '+]'
                endif
                " select the highlighting for the buffer names
                " my default highlighting only underlines the active tab
                " buffer names.
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " add buffer names
                if n == ''
                        let s.= '[New]'
                else
                        let s .= n
                endif
                " switch to no underlining and add final space to buffer list
                let s .= ' '
        endfor
        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'
        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
                let s .= '%=%#TabLineFill#%999Xclose'
        endif
        return s
endfunction

"save vim file in vime folder
" ~/.vimrc file

" swap files (.swp) in a common location
" // means use the file's full path
set dir=~/.vim/_swap//

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/,~/tmp,.

" turn on undo files, put them in a common location
set undofile
set undodir=~/.vim/_undo/

"make vim autoreload on changes in vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrcimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

