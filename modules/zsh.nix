{ config, catppuccin, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    # enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      catppuccin.enable = true;
    };

    history = {
      save = 10000;
      size = 10000;
      path = "$HOME/.cache/zsh_history";
    };

    initExtra = ''
      bindkey '^[[1;5C' forward-word # Ctrl+RightArrow
      bindkey '^[[1;5D' backward-word # Ctrl+LeftArrow

      zstyle ':completion:*' completer _complete _match _approximate
      zstyle ':completion:*:match:*' original only
      zstyle ':completion:*:approximate:*' max-errors 1 numeric
      zstyle ':completion:*' menu select
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"

      # Enable proper UTF-8 support
      export LANG=en_US.UTF-8
      export LC_ALL=en_US.UTF-8

      # Enable proper terminal colors
      export TERM=xterm-256color

      if [[ -o interactive ]]; then
        export SHELL=${pkgs.zsh}/bin/zsh
      fi

      # Start SSH agent
      if [ -z "$SSH_AUTH_SOCK" ]; then
        eval `ssh-agent -s`
        ssh-add ~/.ssh/id_ed25519
        ssh-add ~/.ssh/dt-install-key
      fi

      # Add npm global bin to PATH
      export PATH="$HOME/.npm-global/bin:$PATH"
    '';

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      XDG_CONFIG_HOME = "$HOME/.config";
      REPOS = "$HOME/Repos";
      GITUSER = "johanhanses";
      GHREPOS = "$HOME/Repos/github.com/johanhanses";
      DOTFILES = "$GHREPOS/dotfiles";
      SCRIPTS = "$DOTFILES/scripts";
      SECOND_BRAIN = "$GHREPOS/zettelkasten";
      WORK_DIR = "$REPOS/github.com/Digital-Tvilling";
      LKAB_DIR = "$WORK_DIR/.lkab";
      ONPREM_CONFIG_DIR = "$LKAB_DIR/on-prem/config";
      ONPREM_CERT_DIR = "$LKAB_DIR/on-prem/cert";
      PATH = "$XDG_CONFIG_HOME/scripts:$PATH";
    };

    shellAliases = {
      rebuild = "home-manager switch --flake ~/bo-config#johanhanses";

      repos = "cd $REPOS";
      ghrepos = "cd $GHREPOS";
      dot = "cd $GHREPOS/dotfiles";
      scripts = "cd $DOTFILES/scripts";
      rwdot = "cd $REPOS/github.com/rwxrob/dot";
      rob = "cd $REPOS/github.com/rwxrob";
      dt = "cd $REPOS/github.com/Digital-Tvilling";
      plan = "cd $REPOS/github.com/Digital-Tvilling/DT-Frontend-planning";
      rtm = "cd $REPOS/github.com/Digital-Tvilling/dt-frontend-vite";
      deploy = "cd $REPOS/github.com/Digital-Tvilling/deployment-configuration";
      backend = "cd $REPOS/github.com/Digital-Tvilling/deployment-configuration/external/localhost";
      dti = "cd $REPOS/github.com/Digital-Tvilling/dti";
      sb = "cd $SECOND_BRAIN";
      config = "cd $XDG_CONFIG_HOME";
      sysfig = "cd $HOME/bo-config";
      windows = "cd /mnt/c/Users/johanhanses";

      cat = "bat";
      fast = "fast -u --single-line";

      htop = "btm -b";
      neofetch = "fastfetch";

      nv = "nvim";

      c = "clear";

      n = "npm";
      nr = "npm run";
      ns = "npm start";

      ls = "ls --color=auto";
      ll = "eza -l -a -a -g --group-directories-first --show-symlinks --icons=always";
      l = "eza -l -g --group-directories-first --show-symlinks --icons=always";
      la = "ls -lathr";

      tree = "eza --tree";

      e = "exit";

      gm = "git checkout main && git pull";
      gd = "git diff";
      gp = "git push";
      ga = "git add .";
      gs = "git status";
      gc = "git checkout";
      gcb = "git checkout -b";
      gcm = "git cz";
      wip = "git commit -m 'wip' --no-verify";

      lg = "lazygit";

      k = "kubectl";

      t = "tmux";
      tk = "tmux kill-server";
      tl = "tmux ls";
      ta = "tmux a";

      d = "docker";
      dc = "docker compose";
    };
  };
}
