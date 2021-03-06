set runtimepath+=~/.vim_runtime

" vimrc - https://github.com/amix/vimrc
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Custom Additions
:colorscheme default

" Spell Check
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

:imap jk <esc>
:nnoremap <space> @q
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set nofoldenable

au WinEnter * set nofen
au WinLeave * set nofen
