{ config, pkgs, lib, ... }:

{
  home = {
    stateVersion = "24.11";
    username = "neet";
    homeDirectory = "/Users/neet";
    language.base = "en_GB.UTF-8";
    enableNixpkgsReleaseCheck = true;

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
    ];
  };

  home.file = {
    ".editorconfig".source = files/.editorconfig;
    ".duti" = {
      source = files/.duti;
      onChange = "${lib.getExe pkgs.duti} ~/.duti";
    };
    "Brewfile".source = files/Brewfile;
    "Brewfile.lock.json".source = files/Brewfile.lock.json;
  };

  home.sessionVariables = {
    EDITOR="nvim";
  };

  programs.home-manager = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    envExtra = ''
      export ZSH_DISABLE_COMPFIX="true"
      export VIRTUAL_ENV_DISABLE_PROMPT="true"
      export PATH=/opt/homebrew/bin/:$PATH
      export FPATH=${./zsh/functions}:$FPATH
      export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
    '';

    loginExtra = ''
      . ${./zsh/binding.zsh}
      eval "$(brew shellenv)"
    ''; 

    oh-my-zsh = {
      enable = true;
      plugins = [
        "direnv"
      ];
    };
  };

  programs.neovim = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      gcloud = {
        format = "[@$project]($style) ";
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

  programs.kitty = {
    enable = true;
    themeFile = "GitHub_Dark";

    settings = {
      kitty_mod = "cmd";
      allow_remote_control = true;

      font_family = "JetBrainsMono Nerd Font";
      font_size = "12.0";

      window_padding_width = "8 16";

      cursor_shape = "block";
      cursor_blink_interval = "-1";

      tab_bar_edge = "bottom";
      tab_bar_style = "slant";
    };

    keybindings = {
      "kitty_mod+t" = "new_tab_with_cwd";
      "kitty_mod+backspace" = "send_text all \\x15";
      "kitty_mod+left" = "send_text all \\x01";
      "kitty_mod+right" = "send_text all \\x05";
      "alt+left" = "send_text all \\x1b\\x62";
      "alt+right" = "send_text all \\x1b\\x66";
    };
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
      ignore = "update-index --skip-worktree";
      unignore = "update-index --no-skip-worktree";
    };

    ignores= [
      ".direnv"
      ".DS_Store"
      ".envrc"
      ".flake"
      "flake.lock"
      "flake.nix"
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
