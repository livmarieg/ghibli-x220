{ config, pkgs, lib, ... }:

let
  name = "Clayton Voges";
  gmail = "vogesclayton@gmail.com";
  username = "cvoges12";
  dots = "/home/cvoges12/dots";
  scripts = "/home/cvoges12/scripts";
  maildir = "/home/cvoges12/Mail";
  mod = "Mod4";
  ws0 = "workspace 0";
  ws1 = "workspace 1";
  ws2 = "workspace 2";
  ws3 = "workspace 3";
  ws4 = "workspace 4";
  ws5 = "workspace 5";
  ws6 = "workspace 6";
  ws7 = "workspace 7";
  ws8 = "workspace 8";
  ws9 = "workspace 9";
  ws10 = "workspace 10";

in

{
  home-manager.users.cvoges12 = {
    home = {
      #packages = with pkgs; [ polybar ];
      sessionVariables = {
        EDITOR = "nvim";
      };
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
      urxvt = {
        enable = true;
        iso14755 = true;
        scroll = {
          bar.enable = false;
          keepPosition = true;
          lines = 10000;
          scrollOnKeystroke = true;
          scrollOnOutput = false;
        };
        shading = 100;
        transparent = false;
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
      polybar = {
        enable = true;
        package = pkgs.polybar.override {
          i3GapsSupport = true;
          alsaSupport = true;
          #iwSupport = true;
          githubSupport = true;
        };
        config = {
          "bar/top" = {
            monitor = "LVDS1";
            width = "100%";
            height = "3%";
            radius = 0;
            modules-left = "i3";
            modules-right = "date";
          };

          "module/date" = {
            type = "internal/date";
            internal = 5;
            date = "%d-%m-%y";
            time = "%H:%M";
            label = "%date% %time%";
          };

          "module/i3" = {
            type = "internal/i3";
            scroll-up = "i3wm-wmnext";
            scroll-down = "i3wm-wmprev";
          };
        };
        script = ''
          polybar top &
        '';
      };
    };
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        bars = [];
        modifier = "${mod}";
        floating = {
          modifier = "${mod}";
        };
        gaps = {
          inner = 10;
          outer = 5;
          smartBorders = "on";
          smartGaps = true;
        };
        keybindings = {
          "${mod}+Shift+q" = "exec i3-msg exit";
          "${mod}+Shift+r" = "restart";
          "${mod}+Shift+l" = "exec i3lock";

          "${mod}+d" = "exec --no-startup-id dmenu_run";
          "${mod}+Return" = "exec urxvt";

          "${mod}+w" = "kill";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+r" = "mode resize";
          "${mod}+bar" = "split h";
          "${mod}+minus" = "split v";

          "${mod}+space" = "focus mode_toggle";
          "${mod}+Shift+space" = "floating toggle";
          
          "${mod}+s" = "layout stacking";
          "${mod}+t" = "layout tabbed";
          "${mod}+v" = "layout toggle split";

          "${mod}+p" = "focus parent";
          "${mod}+c" = "focus child";

          # Colemak
          "${mod}+h" = "focus left";
          "${mod}+n" = "focus down";
          "${mod}+e" = "focus up";
          "${mod}+i" = "focus right";
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+n" = "move down";
          "${mod}+Shift+e" = "move up";
          "${mod}+Shift+i" = "move right";

          # Qwerty
          #"${mod}+h" = "focus left";
          #"${mod}+j" = "focus down";
          #"${mod}+k" = "focus up";
          #"${mod}+l" = "focus right";
          #"${mod}+Shift+h" = "move left";
          #"${mod}+Shift+j" = "move down";
          #"${mod}+Shift+k" = "move up";
          #"${mod}+Shift+l" = "move right";

          # Workspaces
          "${mod}+grave" = "${ws0}";
          "${mod}+1" = "${ws1}";
          "${mod}+2" = "${ws2}";
          "${mod}+3" = "${ws3}";
          "${mod}+4" = "${ws4}";
          "${mod}+5" = "${ws5}";
          "${mod}+6" = "${ws6}";
          "${mod}+7" = "${ws7}";
          "${mod}+8" = "${ws8}";
          "${mod}+9" = "${ws9}";
          "${mod}+0" = "${ws10}";
          "${mod}+Shift+grave" = "move container to ${ws0}";
          "${mod}+Shift+1" = "move container to ${ws1}";
          "${mod}+Shift+2" = "move container to ${ws2}";
          "${mod}+Shift+3" = "move container to ${ws3}";
          "${mod}+Shift+4" = "move container to ${ws4}";
          "${mod}+Shift+5" = "move container to ${ws5}";
          "${mod}+Shift+6" = "move container to ${ws6}";
          "${mod}+Shift+7" = "move container to ${ws7}";
          "${mod}+Shift+8" = "move container to ${ws8}";
          "${mod}+Shift+9" = "move container to ${ws9}";
          "${mod}+Shift+0" = "move container to ${ws10}";

          # Audio/Brightness/Media Controls
          "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume 0 +1%";
          "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume 0 -1%";
          "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute 0 toggle";
          "XF86MonBrightnessUp" = "exec xbacklight -inc 1";
          "XF86MonBrightnessDown" = "exec xbacklight -dec 1";
          "XF86AudioPause" = "exec playerctl pause";
          "XF86AudioNext" = "exec playerctl next";
          "XF86AudioPrev" = "exec playerctl previous";
        };
        modes = {
          resize = {
            # Colemak
            "h" = "resize grow width 10 px or 10 ppt";
            "n" = "resize shrink height 10 px or 10 ppt";
            "e" = "resize grow height 10 px or 10 ppt";
            "i" = "resize shrink width 10 px or 10 ppt";

            # Qwerty
            #"h" = "resize grow width 10 px or 10 ppt";
            #"j" = "resize shrink height 10 px or 10 ppt";
            #"k" = "resize grow height 10 px or 10 ppt";
            #"l" = "resize shrink width 10 px or 10 ppt";

            "Escape" = "mode default";
          };
        };
        startup = [
          { command = "systemctl --user restart polybar"; 
            always = true; 
            notification = false; }
        ];
      };
    };
  };
}
