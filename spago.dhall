{ name = "halogen-project"
, dependencies = [ "console", "effect", "halogen", "psci-support", "random" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
