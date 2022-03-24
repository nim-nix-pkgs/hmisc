{
  description = ''Collection of helper utilities'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-hmisc-v0_8_2.flake = false;
  inputs.src-hmisc-v0_8_2.ref   = "refs/tags/v0.8.2";
  inputs.src-hmisc-v0_8_2.owner = "haxscramper";
  inputs.src-hmisc-v0_8_2.repo  = "hmisc";
  inputs.src-hmisc-v0_8_2.type  = "github";
  
  inputs."sorta".owner = "nim-nix-pkgs";
  inputs."sorta".ref   = "master";
  inputs."sorta".repo  = "sorta";
  inputs."sorta".dir   = "";
  inputs."sorta".type  = "github";
  inputs."sorta".inputs.nixpkgs.follows = "nixpkgs";
  inputs."sorta".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-hmisc-v0_8_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-hmisc-v0_8_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}