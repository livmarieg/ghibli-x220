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
    home.sessionVariables = {
      EDITOR = "nvim";
    };
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
        colorTheme = "dark-gray-blue-256";
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
    xsession.windowManager.xmonad = {
      enable = false;
      config = 
        pkgs.writeText "xmonad.hs" ''
          import XMonad                      
          main = xmonad defaultConfig        
              { terminal    = "urxvt"        
              , modMask     = mod4Mask       
              , borderWidth = 3              
              }
        '';                                   
      enableContribAndExtras = true;
    };
  };
}
