{
  description = "Dotfiles";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = { }; # optional
    defaultApp.x86_64-linux = { };
  };
}
