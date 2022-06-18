for plugin in $plugins; do
  source "$HOME/.local/share/zsh/plugins/$plugin/$plugin.plugin.zsh"
done
unset plugins

for file in $files; do
  source "$ZDOTDIR/$file.zsh"
done
unset files
