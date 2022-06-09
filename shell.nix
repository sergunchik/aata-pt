with import <nixpkgs> {};
mkShell {
  nativeBuildInputs = [ python pandoc texlive-full sage pretext ];
}
