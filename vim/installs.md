### install neovim
`brew install neovim fzf ripgrep`

```
script_dir=<insert_bash_code_to_get_script_dir>

Cat $script_dir/fzf_ripgrep_zsh_config.txt >> $HOME/.zshrc
cp $script_dir/.vimrc $HOME/.vimrc
mkdir $HOME/.config/nvim
touch $HOME/.config/nvim/init.vim
cat $script_dir/init_vim.txt >> $HOME/.config/nvim/init.vim
```
