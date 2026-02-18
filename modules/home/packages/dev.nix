{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nixd # nix


    ## formating
    shfmt
    treefmt
    nixfmt
    tree-sitter

    ## C / C++
    gcc
    gdb
    gef
    cmake
    gnumake
    valgrind
    llvmPackages_20.clang-tools

    ## web
    nodejs

    ## Python
    #python3
    #python312Packages.ipython
  ];
}

