{
  enable = true;
  enableZshIntegration = true;
  changeDirWidgetCommand = "fd -td";
  changeDirWidgetOptions = [ "--preview 'tree -C {} | head -200'" ];
  defaultCommand = "fd -tf";
  defaultOptions = [
    "--color 'prompt:4,pointer:4,hl:4,info:4,spinner:4,border:7'"
    "--height 40%"
    "--layout reverse"
    "--border sharp"
  ];
  fileWidgetCommand = "fd -tf";
  fileWidgetOptions = [ "--preview 'bat {}'" ];
  historyWidgetOptions = [ "--sort" "--exact" ];
  tmux = {
    enableShellIntegration = true;
    shellIntegrationOptions = [ "-p" ];
  };
}
