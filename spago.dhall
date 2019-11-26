{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "my-project"
-- , backend = "psgo"
, dependencies =
    [ "effect", "console", "psci-support", "bucketchain", "node-http", "node-fs" ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
