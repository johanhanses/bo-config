{ config, pkgs, ... }:
{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    nodejs_22

    fastfetch
    gnumake
    gcc
    kubectl

    # Nix tooling
    deadnix
    nil
    nix-init
    nixfmt-rfc-style
    nixpkgs-fmt
    deadnix
    nurl
    statix

    # Shell tooling
    shellcheck
    shfmt

    zip
    xz
    unzip
    p7zip
    ripgrep
    eza
    fzf
    cowsay

    file
    which
    tree
    gnused
    gnutar

    gawk
    zstd
    gnupg

    nix-output-monitor
    glow # markdown previewer in terminal
    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    cmatrix
    yazi
  ];
}
