{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs_24
    pnpm
    yarn
    bun
    node-gyp
    typescript-language-server
    tailwindcss-language-server

    lua-language-server
    luarocks

    ruff

    vscode-langservers-extracted

    javaPackages.compiler.openjdk21
    jdt-language-server

    typst
    typstyle
    tinymist
    texliveFull
  ];
}
