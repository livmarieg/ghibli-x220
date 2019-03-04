{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  
    # Applications
    ## Audio
    #cava
    #mopidy
    #mopidy-gmusic
    #mopidy-soundcloud
    #mopidy-spotify
    #ncmpcpp

    ## Editors
    vim
    (import ./nvim.nix)

    ## Graphics
    feh

    ## Misc
    dmenu
    khal
    khard
    #mpvc
    #ranger
    rxvt_unicode
    taskwarrior
    termite
    zathura
    
    ## Networking
    ### Browsers
    firefox
    #w3m

    ### Feedreaders
    #newsboat

    ### IDS
    #snort

    ### Instant-Messengers
    #profanity
    #quaternion
    #riot-web
    #signal-desktop
    #tdesktop
    #telegram-cli
    
    ### IRC
    #weechat

    ### Mailreaders
    #mailsync  # maybe checkout too?
    #neomutt
    #notmuch # maybe check out `notmuch-mutt`
    
    ### Sniffers
    #wireshark

    ## Version-Management
    ### Git-and-Tools
    git

    ## Video
    #mpv

    ## Window-Manager
    i3-gaps
    i3blocks-gaps
    i3lock
    i3status

    # Build-Support
    ## CC-Wrapper
    #clang
    #gcc

    ## Trivial-Builder
    idris
    #libreoffice
    texlive.combined.scheme-full
    #vimPlugins.pluginnames2nix  # use this in the future

    # Development
    ## Compilers
    ghc
    #haskell.packages.ghc822.ghc    # collision. create devenv? or find way to compile djinn
    #haskell.packages.ghc822    # not a package
    #llvm
    openjdk

    ## Haskell-Modules
    ### Hackage-Packages
    haskellPackages.Chart
    haskell.packages.ghc822.djinn
    haskellPackages.ghcid
    haskellPackages.hnix
    haskellPackages.pandoc
    #haskellPackages.purescript
    haskellPackages.stack

    ## Interpreters
    #python37Full

    ## Libraries
    gnutls
    libnotify

    ## Tools
    ### Misc
    dialog

    ## Web
    #nodejs

    # Misc
    ## Emulators
    wine

    # OS-Specific
    ## Linux
    iotop
    powertop
    psmisc
    #linuxPackages.wireguard

    # Servers
    #clamsmtp
    #mpd
    #quagga

    # Tools
    ## Archivers
    unrar
    unzip
    zip

    ## Graphics
    pywal
    scrot    # OR escrotum OR maim OR yaxg

    ## Misc
    neofetch
    #screen
    tmpwatch
    tmux
    vdirsyncer # for khal and khard
    #youtube-dl

    ## Networking
    #aircrack-ng
    #offlineimap
    #traceroute
    wireguard-tools
    #wget
    #whois
    
    ## Security
    #clamav
    gnupg
    #john
    kpcli
    #metasploit
    #nmap
    #thc-hydra

    ## System
    htop
    tree

    # X11
    arandr

    # Top-level
    ## Python-packages
    python36Packages.glances
  ];

  nixpkgs.config = {
    allowBroken = false;
    allowUnfree = true;
  };

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
    };
  };
}
