with import <nixpkgs> {};
mkShell {
  nativeBuildInputs = [ python pandoc ];
}
