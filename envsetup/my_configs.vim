" Custom vim config for vim-gnome + Ultimate vim
" Usage: put this file to ~/.vim_runtime/my_configs.vim
" highlight current line
set cursorline

" Enable mouse use in all modes
:set mouse=a

" Enable line number display
:set number

" Map copy and paste with clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>yy "+y
noremap <Leader>pp "+p

" Configure Sytastic
" toggle Syntastic into passive mode
map <leader>stm :SyntasticToggleMode<cr>
" run SyntasticCheck
map <leader>sc :SyntasticCheck<cr>

" Turn off the preview window for completeopt and keep only menuone
set completeopt-=preview

" Configure YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

