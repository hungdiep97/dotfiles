" SET ==================================================
set encoding=utf-8
set scrolloff=10
set clipboard=unnamed
set number
set numberwidth=5
set foldmethod=indent
set foldlevelstart=20
set tabstop=2 " Softtabs, 2 spaces
set shiftwidth=2
set shiftround
set expandtab
set timeoutlen=500 ttimeoutlen=0
" Set tags for vim-fugitive
set tags^=.git/tags
set tags=tags"

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
if &diff
  set diffopt-=internal
  set diffopt+=vertical
endif

" Use one space, not two, after punctuation.
set nojoinspaces
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
set nocompatible " We're running Vim, not Vi!
nnoremap <SPACE> <Nop>
" END SET ==================================================

" COMMAND ==================================================
command ForceKillRails !kill -9 $(cat tmp/pids/server.pid)
nmap <Leader>krs :ForceKillRails <CR>
" ENDCOMMAND
" LET ==================================================
let mapleader=" "
let g:airline_theme='kolor'

let g:tmux_navigator_no_mappings = 1
let g:better_whitpace_enabled=1

" let g:ale_linters = {
"       \ 'javascript': ['eslint', 'prettier'],
"       \ 'typescript': ['eslint', 'prettier', 'typecheck'],
"       \ 'c': ['clang', 'gcc'],
"       \ 'ruby': ['rubocop'],
"       \ 'dockerfile': ['hadolint'],
"       \ 'eruby': ['erubi'],
"       \ 'json': ['jsonlint'],
"       \ 'yaml': ['yamllint'],
"       \ }
" let g:ale_fixers = {
"       \ 'javascript': ['eslint', 'prettier'],
"       \ 'typescript': ['eslint', 'prettier'],
"       \ 'ruby': ['rubocop'],
"       \ 'json': ['jq', 'fixjson'],
"       \ '*': ['trim_whitespace']
"       \ }
" let g:ale_lint_on_text_changed = 'normal'
" let g:ale_fix_on_save = 0
" let g:ale_linters_explicit = 1
" let g:ale_ruby_rubocop_executable = 'bundle'
" let g:indentLine_char = '¦'
" let g:indentLine_color_term = 239
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:move_key_modifier = 'C'

let g:rails_migrate_command = "Dispatch bundle exec rake"
let g:rspec_command = "Dispatch bundle exec bin/rspec {spec}"
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = 'g<C-n>'
let g:multi_cursor_select_all_word_key = 'g<C-a>'
" END LET ==================================================

" MAPPINGS ==================================================

"GIT
nmap <Leader>gs :Gst<CR>

"AUTO SAVE
nmap <Leader>as :AutoSaveToggle<CR>

"ReactJS
nmap <Leader>rd :call ReactGotoDef()<CR>
" Go to import path with split vertical window
nmap <Leader>rgf <C-W>f<C-W>t<C-W>H

"Common
nmap F za
nmap <Leader>dp :Dispatch<SPACE>
nmap <Leader>f :Rg<SPACE>

"Rails
nmap fa :RGrails <C-R><C-W><CR>
nmap fg :RGall <C-R><C-W><CR>
nmap fm :RGmodel <C-R><C-W><CR>
nmap fv :RGview <C-R><C-W><CR>
nmap fc :RGcontroller <C-R><C-W><CR>
nmap fs :RGstyle <C-R><C-W><CR>
nmap fj :RGjs <C-R><C-W><CR>
nmap fr :RGruby <C-R><C-W><CR>
nmap fb :RGblueprint <C-R><C-W><CR>
nmap <Leader>fa :RGrails<SPACE>
nmap <Leader>fg :RGall<SPACE>
nmap <Leader>fm :RGmodel<SPACE>
nmap <Leader>fv :RGview<SPACE>
nmap <Leader>fc :RGcontroller<SPACE>
nmap <Leader>fs :RGstyle<SPACE>
nmap <Leader>fj :RGjs<SPACE>
nmap <Leader>fr :RGruby<SPACE>
nmap <Leader>fb :RGblueprint<SPACE>
nmap <Leader>- :RubyJump<CR>

" Change inside quotes
nmap c" ci"
nmap c' ci'
" Switch between the last two files
nnoremap '' <C-^>
map <Leader>n <C-w>v<C-h>''

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat me as normal mode
inoremap <C-b> <ESC><Right>bi
inoremap <C-w> <ESC><Right>wi
inoremap <C-e> <ESC><Right>ei
" inoremap <C-k> <Up>
" inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Tmux navigation
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-'> :TmuxNavigatePrevious<cr>

" Move between linting errors
" nnoremap ]r :ALENextWrap<CR>
" nnoremap [r :ALEPreviousWrap<CR>


" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

"Open config file
nmap <Leader>vc :tabedit ~/.vimrc<CR>
nmap <Leader>vb :tabedit ~/.vimrc.bundles<CR>
nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>ntf :NERDTreeFind<CR>
"Remove search highlights
nmap <Leader>uh :noh<CR>

" Save and update
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :q<CR>

" RSpec.vim mappings
nmap <Leader>ta :call RunCurrentSpecFile()<CR>
nmap <Leader>tl :call RunNearestSpec()<CR>

"PlugInstall
nmap <Leader>vi :PlugInstall<CR>
nmap <Leader>vs :source ~/.vimrc<CR>

"Remove whitespace after saved
nmap <Leader>ws :StripWhitespace<CR>

" rails-db-migrate.vim mappings
nmap <Leader>dm :RailsMigrate<CR>
nmap <Leader>dd :RailsMigrateDown<CR>
nmap <Leader>du :RailsMigrateUp<CR>
nmap <Leader>dr :RailsMigrateRedo<CR>

" Insert blank line without insert mode
nmap <Enter> o<ESC>

" ZoomFullPanel
nmap Z <C-w>\|
" UnZoom
nmap zz <C-w>=

" Rails
nmap <Leader>c :Vcontroller<SPACE>
nmap <Leader>m :Vmodel<SPACE>
nmap <Leader>v :Vview<SPACE>
nmap <Leader>vq :Vquery<SPACE>
nmap <Leader>ve :Vservice<SPACE>
nmap <Leader>p :Vpolicy<SPACE>
nmap <Leader>b :Vblueprint<SPACE>
nmap <Leader>t :Vspec<SPACE>

nmap <Leader>ec :Econtroller<SPACE>
nmap <Leader>em :Emodel<SPACE>
nmap <Leader>ev :Eview<SPACE>
nmap <Leader>eq :Equery<SPACE>
nmap <Leader>ep :Epolicy<SPACE>
nmap <Leader>eb :Eblueprint<SPACE>
nmap <Leader>et :Espec<SPACE>

nmap <Leader>d <ESC>obyebug<ESC>
nmap <Leader>vd <ESC>o- byebug<ESC>

nmap + :vertical resize +20<cr>
nmap _ :vertical resize -20<cr>
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

" EasyMotion
map <C-s> <Plug>(easymotion-sn)

" Vim-surround
nmap t' cs"'
nmap t" cs'"
" Copy filename
nmap <Leader>cfn :let @+ = expand("%")<cr>

" Free keybindings
map <S-h> <Nop>
map <S-l> <Nop>
map <S-k> <Nop>
" END MAPPINGS ==================================================

" Navigate NERDTREE to Tmux pane
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeMapJumpPrevSibling = '<Nop>'
" END ========================================
"
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --hidden --no-ignore -l "" -g "!node_modules" -g "!{log,.git,.terragrunt-cache}/" -g "!tmp/cache" -g "!vendor/assets" -g "!p2p-frontend/node_modules" -g "!*.{jpg,png,svg,cache,min.css,min.js,min.scss}" -g "!p2p-frontend/public/assets/chunks"'
elseif executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Find:

command! -bang -nargs=* RGrails
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!p2p-frontend" -g "*.{rb,erb,vue,js,es6,css,sass,scss,yml,rake,haml}" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RGall
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!p2p-frontend/public/assets/chunks" -g "*.{rb,erb,vue,js,es6,css,sass,scss,yml,rake,haml}" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RGmodel
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "app/models/*.rb" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RGcontroller
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "app/controllers/*.rb" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RGview
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "app/views/*.{haml,erb}" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RGruby
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "*.rb" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RGstyle
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "*.{css,sass,scss}" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RGjs
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "*.{js,es6}" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RGblueprint
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "app/blueprints/*_blueprint.rb" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! DectectViewFromController()
  let l:index = line('.')
  while l:index > 1
    let l:line_string = getline(l:index)
    let l:line_words = split(l:line_string, ' ')
    let l:def_index = index(l:line_words, 'def')
    if (l:def_index >= 0)
      let l:func_name = split(l:line_words[l:def_index + 1], "(")[0]
      let l:command_string = ":Vview " . l:func_name . '.html.haml!'
      execute l:command_string
      return
    endif
    let l:index -= 1
  endwhile
  echo 'No method name detected.'
endfunction
map <Leader>dv :call DectectViewFromController()<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <expr><C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_global_extensions = ['coc-solargraph']

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>rnf :call RenameFile()<cr>

function TrimEndLines()
  let save_cursor = getpos(".")
  silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

autocmd BufWritePre *.rb call TrimEndLines()

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set background=dark
colorscheme PaperColor
