# Contributing

Contributions are welcomed!

# Release process

1. update version in `metadata.json`
1. run `github_changelog_generator`
1. update `CHANGELOG.md` and change `unreleased` at the top to the
   version, such as `v2.0.0`, and change `HEAD` to the same version,
   such as `v2.0.0`.
1. Update `README.md` with the command `puppet strings generate --format
   markdown --out README.md`
1. Update the puppet strings documentation with `bundle exec rake
   strings:gh_pages:update`
