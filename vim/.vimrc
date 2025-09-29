set nocompatible              " be iMproved, required
filetype off                  " required

" VUNDLE
" =====================================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-sensible'
" Plugin 'wikitopian/hardmode'

" Git functions
Plugin 'tpope/vim-fugitive'

" Fuzzy file search
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'

" Navigate vim and tmux splits with ctrl [hjkl]
Plugin 'christoomey/vim-tmux-navigator'

" Highlight all searches and fuzzy search
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'

" Python format checker, auto formatter
Plugin 'nvie/vim-flake8'
Plugin 'mindriot101/vim-yapf'

" File type plugins for syntax highlighting etc.
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rust-lang/rust.vim'
Plugin 'udalov/kotlin-vim'
Plugin 'cespare/vim-toml'
Plugin 'zah/nim.vim'
Plugin 'JuliaEditorSupport/julia-vim'

" Visualize undo history
Plugin 'sjl/gundo.vim'

" Clipboard access on osx
Plugin 'kana/vim-fakeclip'

Plugin 'vim-scripts/paredit.vim'

Plugin 'junegunn/goyo.vim'

Plugin 'vim-scripts/applescript.vim'

Plugin 'tpope/vim-abolish'

Plugin 'majutsushi/tagbar'

" Plugin 'vim-scripts/AnsiEsc.vim'

Plugin 'jpalardy/vim-slime'

Plugin 'AndrewRadev/linediff.vim'

" llvm and mlir 
Plugin 'rhysd/vim-llvm'

" Plugin 'hanschen/vim-ipython-cell'

Plugin 'NoahTheDuke/vim-just'

Plugin 'Glench/Vim-Jinja2-Syntax.git'

Plugin 'ledger/vim-ledger.git'

Plugin 'vimwiki/vimwiki'

Plugin 'ConradIrwin/vim-bracketed-paste.git'

call vundle#end()            " required
filetype plugin indent on    " required
" =====================================================================

" show existing tabs a 4 spaces width
set tabstop=2 
" when indenting with '>', use 4 spaces
set shiftwidth=2
" on pressing tab, insert 4 spaces
set expandtab

let mapleader = "-"
imap jk <esc>
" open nerd tree with -t
map <leader>t :NERDTreeToggle<CR>
" add line numbers
set number

" Keep swap files out of the working directory
set dir=~/.vim/swapfiles

" solarized options
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" enable hard mode by default
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" " use ripgrep for faster ctrlp indexing
" let g:ctrlp_user_command = 'rg -i --no-ignore-vcs --color never --files -L %s'
" " X disable caching as ripgrep is fast enough
" " ripgrep is not fast enough in some cases (currently llvm)
" let g:ctrlp_use_caching = 1
" " w flag means search for an ancestor of cwd rather than ancestor of file directory
" let g:ctrlp_working_path_mode = 'rwa'
map <C-p> :FZF<CR>

nnoremap <silent> <leader>v :TagbarToggle<CR>

" Make a numpad using alt and the keys uiojklm,./
inoremap ¨ 1
inoremap ˆ 2
inoremap ø 3
inoremap ∆ 4
inoremap ˚ 5
inoremap ¬ 6
inoremap µ 7
inoremap ≤ 8
inoremap ≥ 9
inoremap ÷ 0

" Run custom actions in the tmux pane on the left
" map <leader>r :silent exec ':!tmux send-keys -t left "./.v_run.sh" C-m' \| exec ':redraw!'<CR>
" map <leader>c :silent exec ':!tmux send-keys -t left "./.v_check.sh" C-m' \| exec ':redraw!'<CR>
" Build
map <leader>b :silent exec ':!./.build.sh' \| exec ':redraw!'<CR>
" Rebuild
map <leader>rb :silent exec ':!./.rebuild.sh' \| exec ':redraw!'<CR>
" Check
map <leader>c :silent exec ':!./.check.sh' \| exec ':redraw!'<CR>
" Run
map <leader>rr :silent exec ':!./.run.sh' \| exec ':redraw!'<CR>

" Navigate tabs with the tab key
map <tab> gt
map <s-tab> gT

" copy to file so then accesible outside of vim
vmap <C-c> y:new ~/.vimbuffer<CR>Vgp:x<CR>

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Incremental search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Fuzzy incremental search
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

map <C-x> :q<CR>

" ignore whitespace in vimdiff
" set diffopt+=iwhite
" set diffexpr=DiffW()
" function DiffW()
"   let opt = ""
"   if &diffopt =~ "icase"
"     let opt = opt . "-i "
"   endif
"   if &diffopt =~ "iwhite"
"     let opt = opt . "-w " " swapped vim's -b with -w
"   endif
"   silent execute "!diff -a --binary " . opt .
"     \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
" endfunction

" Search for visually selected text
vnoremap * y/\<\V<C-r>=escape(@",'/\')<CR>\><CR>
vnoremap # y?\<\V<C-r>=escape(@",'/\')<CR>\><CR>

" Paste the tmux buffer into vim
map <leader>p :read !tmux save-buffer ~/.tmux-paste && cat ~/.tmux-paste<CR>

" Setup vim-slime to work with tmux
let g:slime_target = "tmux"

" Only one of the two lines below need to be active to work with python
let g:slime_bracketed_paste = 1
" let g:slime_python_ipython = 1

let g:slime_cell_delimiter = "# %%"
nmap <leader>s <Plug>SlimeSendCell
nmap <leader>x :SlimeSendCurrentLine<CR>

-" Default config for slime as I usually have vim on the right pane
let g:slime_default_config = {"socket_name": "default", "target_pane": "0"}
let g:slime_dont_ask_default = 1

augroup pir_ft
  au!
  autocmd BufNewFile,BufRead *.pir   set syntax=mlir
augroup END

augroup inc_ft
  au!
  autocmd BufNewFile,BufRead *.h.inc   set syntax=cpp
  autocmd BufNewFile,BufRead *.cpp.inc   set syntax=cpp
augroup END

" map [[ ?{<CR>w99[{
" map ][ /}<CR>b99]}
" map ]] j0[[%/{<CR>
" map [] k$][%?}<CR>
map [[ ?^[^#\/} \t]<CR>
map ]] /^[^#\/} \t]<CR>
map ][ /^}<CR>
map [] ?^}<CR>
 
" auto insert closing braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" hledger
" au FileType ledger noremap { ?^\d<CR>
" au FileType ledger noremap } /^\d<CR>
let g:ledger_is_hledger = v:true
let g:ledger_fuzzy_account_completion = 1
au FileType ledger setlocal tabstop=4 shiftwidth=4

map <leader>D :put = strftime('%Y-%m-%d')<CR>Ea<Space>
