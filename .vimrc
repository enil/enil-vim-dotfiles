set nocompatible
filetype off

" use Vundle
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" load local settings
let s:local_settings_file=glob('$HOME/.vimrc.local')
if (filereadable(s:local_settings_file))
    exec 'source ' . s:local_settings_file
end

" PLUGINS

Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Raimondi/delimitMate'
Bundle 'junegunn/vim-easy-align'
Bundle 'kana/vim-textobj-user'
Bundle 'scrooloose/nerdtree'
" git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
" syntax check
Bundle 'scrooloose/syntastic'
" filetypes
Bundle 'mikelue/vim-maven-plugin'
Bundle 'tpope/vim-cucumber'
Bundle 'sukima/xmledit'
Bundle 'kchmck/vim-coffee-script'
Bundle 'fatih/vim-go'
Bundle 'vim-ruby/vim-ruby'
Bundle 'rhysd/vim-textobj-ruby'
" themes
Bundle 'tomasr/molokai'
Bundle 'sickill/vim-monokai'
Bundle 'altercation/vim-colors-solarized'

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

" FILE TYPES

" Podfiles and Vagrantfiles are in Ruby
au BufNewFile,BufRead Podfile set ft=ruby
au BufNewFile,BufRead Vagrantfile set ft=ruby
" Gradle scripts are in Groovy
au BufNewFile,BufRead *.gradle set ft=groovy
" outdent accessor modifiers in Ruby
let g:ruby_indent_access_modifier_style='outdent'

" BEHAVIOR

syntax on
filetype plugin indent on
set encoding=utf-8
set number ruler
set backspace=indent,eol,start
set wildignore=*/target/*,*/work/*,*.o,*.class
set cursorline
set colorcolumn=120
" hard tabs width 4
set ts=4 sw=4 noexpandtab
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

" KEYS

" toggle relative line numbering
nmap <silent><leader>n :setlocal relativenumber!<CR>
" toggle invisibles
nmap <silent><leader>h :setlocal list!<CR>
" clear search hightlight
nmap <silent><leader><space> :noh<CR>
" open CtrlP
nmap <silent><leader><cr> :CtrlP<CR>
" toggle NERDTree
nmap <silent><leader><leader> :NERDTreeToggle<CR>
" check syntax
nmap <silent><leader>s :SyntasticCheck<CR>
" toggle gitgutter
nmap <silent><leader>g :GitGutterSignsToggle<CR>

" APPEARANCE
set background=dark
color molokai

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

