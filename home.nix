{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/ssh.nix
    ./modules/neovim.nix
    ./modules/fzf.nix
    ./modules/bat.nix
    ./modules/bottom.nix
    ./modules/tmux.nix
  ];

  home = {
    username = "johanhanses";
    homeDirectory = "/home/johanhanses";
    stateVersion = "24.11";

    file.".npmrc".text = ''
      prefix=${config.home.homeDirectory}/.npm-global
    '';

    sessionVariables = {
      PATH = "$HOME/.npm-global/bin:$PATH";
    };
  };

  programs.home-manager.enable = true;
  programs.eza.enable = true;
}
