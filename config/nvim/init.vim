set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
lua require('plugins')
lua require('config')
