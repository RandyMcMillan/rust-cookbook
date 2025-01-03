alias d := doc
alias nl := nix-lint
alias uf := update-flake-dependencies
alias ud := update-dependencies
alias r := run
alias t := test
alias b := build
alias c := check
alias i := install
alias ia := install-all
alias rr := run-release
alias w := watch

default:
    @just --choose || true

book:
    mdbook serve --open || cargo +nightly install mdbook --vers "0.4.43"

clippy:
    cargo +nightly clippy --all-targets --all-features

deny:
    cargo +nightly deny check

test:
    cargo +nightly test -- --nocapture

run:
    cargo +nightly run --bin rust-cookbook -- -h || true

install-all:install
install:
    cargo +nightly install --path .

build:
    cargo +nightly build --bins || true

build-examples:
    cargo +nightly build --examples || true

check:
    cargo +nightly check || true

run-release:
    cargo +nightly run --release --bin rust-cookbook -h || true

doc:
    cargo +nightly doc --open --offline

# Update and then commit the `Cargo.lock` file
update-dependencies:
    cargo update
    git add Cargo.lock
    git commit Cargo.lock -m "update(cargo): \`Cargo.lock\`"

# Future incompatibility report, run regularly
future:
    cargo check --future-incompat-report

watch:
    cargo watch -x check -x test -x build


nix-actionlint:
    nix develop .#actionlintShell --command actionlint

nix-cargo-diet:
    nix develop .#lintShell --command cargo diet

nix-cargo-tarpaulin:
    nix develop .#lintShell --command cargo tarpaulin --out html --exclude-files "benches/*"

nix-cargo-public-api:
    nix develop .#lintShell --command cargo public-api

nix-cargo-diff:
    nix develop .#lintShell --command cargo public-api diff

nix-lint:
    nix develop .#lintShell --command cargo diet
    nix develop .#lintShell --command cargo deny check licenses sources
    nix develop .#lintShell --command typos
    nix develop .#lintShell --command lychee *.md
    nix develop .#fmtShell --command treefmt --fail-on-change
    nix develop .#lintShell --command cargo udeps
    nix develop .#lintShell --command cargo machete
    nix develop .#lintShell --command cargo outdated
    nix develop .#lintShell --command taplo lint
    nix develop .#actionlintShell --command actionlint --ignore SC2002
    cargo check --future-incompat-report
    nix flake check

update-flake-dependencies:
    nix flake update --commit-lock-file

# build all examples
nix-examples:
    nix develop --command $SHELL
    example_list=$(cargo build --example 2>&1 | sed '1,2d' | awk '{print $1}')

    # Build each example
    # shellcheck disable=SC2068
    for example in ${example_list[@]}; do
    cargo build --example "$example"
    done

nix-examples-msrv:
    set -x
    nix develop .#msrvShell --command
    rustc --version
    cargo --version
    example_list=$(cargo build --example 2>&1 | grep -v ":")

    # Build each example
    # shellcheck disable=SC2068
    for example in ${example_list[@]}; do
    cargo build --example "$example"
    done
