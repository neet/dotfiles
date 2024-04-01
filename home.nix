{ config, pkgs, lib, ... }:

{
  home.stateVersion = "23.05";
  home.username = "neet";
  home.homeDirectory = "/Users/neet";
  home.language.base = "en_GB.UTF-8";

  home.packages = [
    pkgs.ack
    pkgs.bat
    pkgs.comma
    pkgs.duti
    pkgs.gcsfuse
    pkgs.ghq
    pkgs.glow
    pkgs.httpie
    pkgs.jq
  ];

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
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    envExtra = ''
      export ZSH_DISABLE_COMPFIX="true"
      export VIRTUAL_ENV_DISABLE_PROMPT="true"
    '';

    loginExtra = ''
      export FPATH=${./zsh/functions}:$FPATH
      . ${./zsh/binding.zsh}
      eval "$(/opt/homebrew/bin/brew shellenv)"
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
    nix-direnv.enable = true;

    # https://rgoswami.me/posts/poetry-direnv/
    stdlib = ''
    layout_poetry() {
      if [[ ! -f pyproject.toml ]]; then
        log_error 'No pyproject.toml found.  Use `poetry new` or `poetry init` to create one first.'
        exit 2
      fi

      local VENV=$(dirname $(poetry run which python))
      export VIRTUAL_ENV=$(echo "$VENV" | rev | cut -d'/' -f2- | rev)
      export POETRY_ACTIVE=1
      PATH_add "$VENV"
    }
    '';
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
      ignore = "update-index --skip-worktree";
      unignore = "update-index --no-skip-worktree";
    };

    ignores= [
      ".direnv"
      ".DS_Store"
      # "flake.lock"
      # "flake.nix"
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

    lfs = {
      enable = true;
    };
  };
}
