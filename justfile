help:
    @just -l

cluster-up:
    k3d cluster create sean --agents 2

cluster-down:
    k3d cluster delete sean

cluster-reset:
    just cluster-down
    just cluster-up

connect:
    k3d kubeconfig get sean > .kubeconfig

nix-check:
    nix flake check

nix-check-update:
    nix fmt
    nix run .#pkgVersionSnapshotTest

nix-flake-update:
    nix flake update --commit-lock-file
    just nix-check-update
