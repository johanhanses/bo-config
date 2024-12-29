# { config, pkgs, ... }:
# {
#   programs.starship = {
#     enable = true;
#
#     # custom settings
#     settings = {
#       add_newline = true;
#       aws.disabled = true;
#       gcloud.disabled = true;
#       line_break.disabled = false;
#
#       os = {
#         disabled =  false;
#         # style = "bold yellow";
#       };
#     };
#   };
# }

{ lib, ... }:
{
  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = lib.mkDefault {
        format = lib.concatStrings [
          "$os"
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_state"
          "$git_status"
          "$nix_shell"
          "$status"
          "$nodejs"
          "$line_break"
          "$character"
        ];

        fill.symbol = " ";
        hostname.ssh_symbol = "";
        rust.symbol = " ";
        status.disabled = false;
        username.show_always = true;
        username.format = "[ $user]($style)@";

        os.disabled = false;
        os.symbols = {
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          EndeavourOS = "";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
          Pop = "";
        };

        character = {
          success_symbol = "[❯](purple)";
          error_symbol = "[❯](red)";
          vicmd_symbol = "[❯](green)";
        };

        directory = {
          read_only = " ";
          # home_symbol = " ~";
          style = "blue";
          truncate_to_repo = false;
          truncation_length = 5;
          truncation_symbol = ".../";
        };

        docker_context.symbol = " ";

        git_branch = {
          symbol = " ";
          format = "[ $branch]($style)";
          style = "green";
        };

        git_status = {
          format = "[[( $conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
          style = "cyan";
          conflicted = "=$count ";
          untracked = "?$count ";
          modified = "!$count ";
          staged = "+$count ";
          renamed = "»$count ";
          deleted = "​✘$count ";
          stashed = "≡";
        };

        git_state = {
          format = "\([$state( $progress_current/$progress_total)]($style)\) ";
          style = "bright-black";
        };

        kubernetes = {
          disabled = false;
          format = "[$symbol$context](cyan bold) ";
        };

        nix_shell = {
          disabled = false;
          symbol = "❄️ ";
          format = "via [$symbol\($name\)]($style)";
        };

        nodejs = {
          disabled = false;
        };
      };
    };
  };
}
