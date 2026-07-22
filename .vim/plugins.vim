call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'catppuccin/vim', {'as': 'catppuccin' }
    Plug 'ayu-theme/ayu-vim'
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/everforest'
    Plug 'joshdick/onedark.vim'
    Plug 'sonph/onehalf'
    Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
    Plug 'nordtheme/vim'
    Plug 'airblade/vim-gitgutter'
"  Plug 'tribela/vim-transparent'
    Plug 'sainnhe/gruvbox-material'
    Plug 'menisadi/kanagawa.vim'
    Plug 'ghifarit53/tokyonight-vim' 
    Plug 'mhinz/vim-startify'
call plug#end()

" tabline, bottom line
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1
let g:indentLine_char = ''
let g:airline_first_char = { '' : '' }
let g:airline_multiline = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let g:airline_powerline_fonts = 1

" icons
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackers = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
let g:DevIconsDefaultFolderOpenSymbol = ' '
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:webdevicons_enable_startify = 1

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1

" Startify
let g:startify_session_dir = '~/.vim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['    Last files']            },
          \ { 'type': 'dir',       'header': ['    Last files in '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['    Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['    Bookmarks']      },
          \ { 'type': 'commands',  'header': ['    Commands']       },
          \ ]
