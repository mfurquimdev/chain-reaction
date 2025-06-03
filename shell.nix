{ pkgs ? import <nixpkgs-unstable> { } }:

with pkgs;

mkShell rec {
  nativeBuildInputs = [
    cargo
    clippy
    gcc
    pkg-config
    rustc
    rustfmt
    rustup
    rocmPackages.llvm.lld
  ];

  buildInputs = [
    udev
    alsa-lib-with-plugins
    vulkan-loader
    # xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr # To use the x11 feature
    libxkbcommon wayland # To use the wayland feature
    openssl

  ];
  LD_LIBRARY_PATH = lib.makeLibraryPath buildInputs;
}
