_: {
  programs = {
    tmate.enable = true;

    tmux = {
      enable = true;
      catppuccin.enable = true;

      aggressiveResize = true;
      baseIndex = 1;
      clock24 = true;
      sensibleOnTop = true;
      # This should either be screen-256color or tmux-256color where it exists
      terminal = "tmux-256color";

      extraConfig = ''
        set -g status on
        set -g mouse on

        # Where this shows 'alacritty' - the value should be whatever $TERM is outside tmux
        # set-option -ga terminal-overrides ",alacritty:Tc"
        set -ag terminal-overrides ",tmux-256color:RGB"

        # Catppuccin options
        set -g @catppuccin_host 'on'
        set -g @catppuccin_window_tabs_enabled 'on'

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
        set -g set-titles on

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

        # # rename panes to current working directory
        set-option -g automatic-rename on
        set-option -g automatic-rename-format '#{b:pane_current_path}'
      '';
    };
  };
}
