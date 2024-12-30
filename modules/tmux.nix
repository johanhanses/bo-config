_: {
  programs = {
    tmate.enable = true;

    tmux = {
      enable = true;

      aggressiveResize = true;
      baseIndex = 1;
      clock24 = true;
      sensibleOnTop = true;
      terminal = "tmux-256color";

      extraConfig = ''
        set -g status on
        set -g mouse on

        set -ag terminal-overrides ",tmux-256color:RGB"

        # new pane path
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"

        # Change the path for newly created windows
        bind c new-window -c "#{pane_current_path}"

        # Allow holding Ctrl when using using prefix+p/n for switching windows
        bind C-p previous-window
        bind C-n next-window

        # Move around panes like in vim
        bind -r h select-pane -L
        bind -r j select-pane -D
        bind -r k select-pane -U
        bind -r l select-pane -R

        # Increase scrollback buffer size
        set -g history-limit 100000

        # Renumber windows when one is removed.
        set -g renumber-windows on

        # Allow tmux to set the terminal title
        # set -g set-titles on

        # Monitor window activity to display in the status bar
        setw -g monitor-activity on

        set -s escape-time 0

        set-option -g focus-events on

        set -g status-position bottom

        # replace C-b by C-a instead of using both prefixes
        set-option -gu prefix2
        unbind-key C-a
        unbind-key C-b
        set-option -g prefix C-a
        bind-key C-a send-prefix

        # 'PREFIX r' to reload of the config file
        unbind r
        bind r source-file ~/.config/tmux/tmux.conf\; display-message '~/.tmux.conf reloaded'

        # rename panes to current working directory
        set-option -g automatic-rename on
        set-option -g automatic-rename-format '#{b:pane_current_path}'


        # Catppuccin options
        set -g @catppuccin_flavor "macchiato"
        set -g @catppuccin_status_background "none"
        set -g @catppuccin_host "off"
        set -g @catppuccin_window_text " #{b:pane_current_path}"
        set -g @catppuccin_window_current_text " #{b:pane_current_path}"

        # Make the status line more pleasant.
        set -g status-left ""
        set -g status-right '#[fg=#{@thm_crust},bg=#{@thm_teal}] #{user}@#T '

        # Ensure that everything on the right side of the status line
        # is included.
        set -g status-right-length 100

      '';
    };
  };
}
