{ config, pkgs, lib, ... }:

{
  home = {
    stateVersion = "24.11";
    username = "neet";
    homeDirectory = "/Users/neet";
    language.base = "en_GB.UTF-8";

    packages = [
      pkgs.ack
      pkgs.bat
      pkgs.comma
      pkgs.devenv
      pkgs.duti
      pkgs.ghq
      pkgs.glow
      pkgs.httpie
      pkgs.jq
      pkgs.ripgrep
    ];
  };

  home.file = {
    ".config/ghostty/config".source = ./files/ghostty/config;
    ".config/nvim/lua".source = ./files/nvim/lua;
    ".duti".source = ./files/.duti;
    ".editorconfig".source = ./files/.editorconfig;
    ".hushlogin".source = ./files/.hushlogin;
    "Brewfile.lock.json".source = ./files/Brewfile.lock.json;
    "Brewfile".source = ./files/Brewfile;
  };

  programs.home-manager = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    envExtra = ''
      PATH=/opt/homebrew/bin/:$PATH
      FPATH=${./zsh/functions}:$FPATH
    '';

    loginExtra = ''
      . ${./zsh/binding.zsh}
    ''; 

    profileExtra = ''
      eval "$(brew shellenv)"
    '';

    # https://discourse.nixos.org/t/zsh-compinit-warning-on-every-shell-session/22735
    completionInit = "autoload -U compinit && compinit -i";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraConfig = ''
      source ${pkgs.vimPlugins.vim-plug}/plug.vim
    '';

    extraLuaConfig = ''
      require("plugins")
      require("conf.appearance")
      require("conf.cmp")
      require("conf.keymaps")
      require("conf.lsp")
    '';

    withNodeJs = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      gcloud = {
        disabled = true;
      };
    };
  };

  # https://mipmip.github.io/home-manager-option-search/?query=direnv
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--color dark,gutter:-1"
    ];
  };

  programs.git = {
    enable = true;
  
    userName = "Ryo Igarashi";
    userEmail = "n33t5hin@gmail.com";

    aliases = {
      st = "status -s";
      lg = "log --oneline";
      cane = "commit --amend --no-edit";
      diffns = "diff -- . ':(exclude)*.lock'";
      last = "log -1 HEAD";
      pushf = "push --force-with-lease --force-if-includes";
      pushff = "push --force-with-lease --force";
      pushfff = "push --force";
    };

    ignores= [
      ".direnv"
      ".DS_Store"
      ".envrc"
      ".flake"
    ];

    extraConfig = {
      core = {
        repositoryformatversion = 0;
        filemode = true;
        bare = false;
        logallrefupdates = true;
        ignroefalse = false;
        precomoppseunicode = true;
        quotepath = false;
      };
      push = {
        default = "current";
      };
      pull = {
        rebase = "true";
      };
    };

    lfs = {
      enable = true;
    };
  };
}
