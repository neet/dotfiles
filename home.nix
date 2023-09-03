{ config, pkgs, lib, ... }:

{
  home.stateVersion = "23.05";
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.language.base = "en_GB.UTF-8";

  home.packages = [
    pkgs.ack
    pkgs.bat
    pkgs.ghq
    pkgs.glow
    pkgs.jq
    pkgs.duti
    pkgs.httpie
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".editorconfig".source = dotfiles/.editorconfig;
    ".duti" = {
      source = dotfiles/.duti;
      onChange = "${lib.getExe pkgs.duti} ~/.duti";
    };
  };

  home.sessionVariables = {
    EDITOR="nvim";
  };

  programs.home-manager = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    loginExtra = ''
      export FPATH=${./zsh/functions}:$FPATH
      . ${./zsh/binding.zsh}
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

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--color dark,gutter:-1"
    ];
  };

  programs.kitty = {
    enable = true;
    theme = "GitHub Dark";

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
    };

    ignores= [
      ".DS_Store"
      ".envrc"
      ".tool-versions"
    ];

    extraConfig = {
      core = {
        repositoryformatversion = 0;
        filemode = true;
        bare = false;
        logallrefupdates = true;
        ignroefalse = false;
        precomoppseunicode = true;
      };
      push = {
        default = "current";
      };
      pull = {
        rebase = "true";
      };
    };
  };
}
