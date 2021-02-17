{ name = "halogen-project"
, dependencies =
  [ "console"
  , "css"
  , "effect"
  , "halogen"
  , "halogen-css"
  , "psci-support"
  , "random"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
