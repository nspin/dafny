let
  pkgs = (import ../../rust-sel4 {}).pkgs.build;

in
with pkgs;

mkShell {
  nativeBuildInputs = [
    this.dafny.remote
    python3
  ];

  shellHook = ''
    regen() {
      (cd Source/DafnyCore && ./DafnyGeneratedFromDafny.sh)
    }
  '';
}
