set nocompatible
filetype off

" use Vundle
set runtimepath+=~/.vim/bundle/vundle/

" load local settings
let s:local_settings_file=glob('$HOME/.vimrc.local')
if (filereadable(s:local_settings_file))
    exec 'source ' . s:local_settings_file
end

" PLUGINS
if empty(glob('~/.vim/bundle'))
	autocmd VimEnter * PlugInstall | source $MYVIMRC | close
end

call plug#begin('~/.vim/bundle')

Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'ngmy/vim-rubocop'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'thoughtbot/vim-rspec'
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" syntax check
Plug 'scrooloose/syntastic'
" filetypes
Plug 'mikelue/vim-maven-plugin', { 'branch': 'origin' }
Plug 'tpope/vim-cucumber'
Plug 'sukima/xmledit'
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'vim-ruby/vim-ruby'
Plug 'rhysd/vim-textobj-ruby'
Plug 'ekalinin/Dockerfile.vim'
Plug 'kylef/apiblueprint.vim'
Plug 'https://github.com/nginx/nginx.git', { 'name': 'nginx', 'rtp': 'contrib/vim' }
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
" themes
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'

call plug#end()

" PLUGIN SETTINGS

" airline
let g:airline_powerline_fonts=1
" always show
set laststatus=2
" line number count symbol
if !exists('g:airline_symbols')
	let g:airline_symbols={'linenr': '#'}
end
let g:airline_theme='luna'

" CtrlP
" git project as root
let g:ctrlp_working_path_mode='r'

" vim-easy-align
vmap <Tab> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" syntastic
" don't check on write
let g:syntastic_mode_map = { 'mode': 'passive' }

" emmet
" use tab to expand
autocmd FileType html,xml,eruby,css imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" FILE TYPES

" Ruby DSLs
au BufNewFile,BufRead Podfile,Vagrantfile,Guardfile set ft=ruby
" Gradle scripts are in Groovy
au BufNewFile,BufRead *.gradle set ft=groovy
" Dockerfiles with alternative naming
au BufNewFile,BufRead *.df set ft=Dockerfile
" outdent accessor modifiers in Ruby
let g:ruby_indent_access_modifier_style='outdent'

" BEHAVIOR

syntax on
filetype plugin indent on
set encoding=utf-8
set number relativenumber ruler
set backspace=indent,eol,start
set cursorline
set colorcolumn=120
set showcmd
" hard tabs width 4
set tabstop=4 shiftwidth=4 noexpandtab
" make backspace work as expected for soft tabs
set softtabstop=-1
" invisible characters
set listchars=tab:>-,trail:.,eol:$
" typeahead search
set hlsearch incsearch noignorecase
" highlight doxygen comments
let g:load_doxygen_syntax=1
" split windows to the right or below
set splitright splitbelow
" show completion menu in command line
set wildmenu
" ignore temporary directories from CtrlP etc
set wildignore=*/target/*,*/work/*,*/doc/*,*/docs/*,*/temp/*,*/tmp/*,*/vendor/*,*/node_modules/*,*.o,*.class
" mouse support in terminal
set mouse=a ttymouse=xterm2

" KEYS

" toggle relative line numbering
nmap <silent><leader>n :setlocal relativenumber!<CR>
" toggle invisibles
nmap <silent><leader>h :setlocal list!<CR>
" clear search hightlight
nmap <silent><leader><space> :noh<CR>
" open CtrlP
nmap <silent><leader><cr> :CtrlP<CR>
" open NERDTree showing the current file
nmap <silent><leader><leader> :NERDTreeFind<CR>
" check syntax
nmap <silent><leader>s :SyntasticCheck<CR>
" toggle gitgutter
nmap <silent><leader>g :GitGutterSignsToggle<CR>
" jump between windows
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" APPEARANCE
set background=dark
color badwolf

if &term =~ '256color'
	" make background work correctly in tmux
	set t_ut=
end

if (has('gui'))
	" always use text dialogs and UI
	set guioptions=cm
	" use Airline compatible font
	if (has('mac'))
		set guifont=Sauce\ Code\ Powerline\ Light:h11
	else
		set guifont=Source\ Code\ Pro\ for\ Powerline\ Light\ 10
	end
end

