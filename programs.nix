{ config, lib, pkgs, ... }:

{
  programs = {
    bash.enableCompletion = false;
    command-not-found.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    tmux = {
      enable = true;
      secureSocket = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      enableGlobalCompInit = true;
      autosuggestions.enable = true;
      ohMyZsh = {
        enable = true;
      };
      syntaxHighlighting.enable = true;
    };
  };
}
