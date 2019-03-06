{ config, pkgs, lib, ... }:

let
  name = "Clayton Voges";
  gmail = "vogesclayton@gmail.com";
  username = "cvoges12";
  dots = "/home/cvoges12/dots";
  scripts = "/home/cvoges12/scripts";
  maildir = "/home/cvoges12/Mail";

in

{
  home-manager.users.cvoges12 = {
    programs = {
      git = {
        enable = true;
        userEmail = "${gmail}";
        userName = "${username}";
      };
      #mbsync = {
      #  enable = true;
      #};
      firefox = {
        enable = true;
        enableAdobeFlash = false;
      };
      taskwarrior = {
        enable = true;
        config = {
          confirmation = true;
        };
      };
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        #defaultKeymap = ;
        history = {
          expireDuplicatesFirst = true;
          extended = true;
          ignoreDups = true;
          path = ".histfile";
          save = 10000;
          share = true;
        };
        initExtra = "";
        profileExtra = "";
        loginExtra = "";
        logoutExtra = "";
        #localVariables
        #sessionVariables
        #shellAliases
        oh-my-zsh = {
          enable = true;
          #plugins
          #theme
        };
        #plugins
      };
    };
    services = {
      gpg-agent = {
        enable = true;
        enableSshSupport = true;
        defaultCacheTtl = 1800;
      };
    };
  };
}
