{ buildDunePackage, alcotest, atd, atdgen-codec-runtime, atdgen-runtime, biniou, re, yojson
, python3
}:

buildDunePackage {
  pname = "atdgen";
  inherit (atdgen-codec-runtime) version src;

  buildInputs = [ atd re ];

  propagatedBuildInputs = [ atdgen-runtime ];

  strictDeps = true;
  doCheck = true;
  nativeCheckInputs = [ atd (python3.withPackages (ps: [ ps.jsonschema ]))];
  checkInputs = [ alcotest atdgen-codec-runtime ];

  meta = (builtins.removeAttrs atd.meta [ "mainProgram" ]) // {
    description = "Generates efficient JSON serializers, deserializers and validators";
  };
}
