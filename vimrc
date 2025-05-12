" BASIC SETUP:
" Leave vi behind
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" better colors
set bg=light
if !has('gui_running')
    set t_Co=256
endif

" tabs setup
set tabstop=4
set shiftwidth=4
set expandtab

" better searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" search and replace
nnoremap ,sr :%s///g


" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" wildmode full for cycling through completion by tab-tab
set wildmode=full
" wildignore for stopping nodemodules messing with file find
set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk

" For quick access
nnoremap <C-p> :find<space>


" TAG JUMPING:
" Create the `tags` file (need to instal ctags first)
command! MakeTags !ctags -R .
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - User ^t to jump back up the tag stack


" BASIC AUTOCOMPLETE:
" Built-in no need to do anything
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" - ^n & ^p to go back and forth in the suggestions menu


" FILE BROWSING:
" Tweaks for netrw
let g:netrw_banner=0		" disable annoying banner
let g:netrw_browse_split=2	" open in prior window
let g:netrw_altv=1		" open splits to the right
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" - :edit a folder to open a file browser
" <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw_browse-maps| for more mappings
" quickly open and close the netrw buffer
" using Lex for Left-explore i.e open explore in a buffer to the left
nnoremap <C-b> :Lex<cr>:vertical resize 35<cr>
inoremap <C-b> <Esc>:Lex<cr>:vertical resize 35<cr>


" SNIPPETS:
" much needed for vim
" Need to make more of these
nnoremap ,html :-1read $HOME/.vim/snippets/template.html<cr>6jf>a
nnoremap ,rafce :-1read $HOME/.vim/snippets/reacttemplate.jsx<cr>2jw


" BACKUPS:
" disable backups and create a undo history
set noswapfile
set nobackup
set undofile
set undodir=$HOME/.vim/undodir

