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

    # Node.js and npm (Essentials)
    nodejs
    nodePackages.npm

    # TypeScript tools and LSP
    nodePackages.typescript
    nodePackages.typescript-language-server

    # Formatting tools
    nodePackages.prettier

    # VSCode language servers (HTML, CSS, JSON, ESLint)
    nodePackages.vscode-langservers-extracted

    # Tailwind CSS LSP
    nodePackages.tailwindcss-language-server

    ## Python
    #python3
    #python312Packages.ipython
  ];
}





























