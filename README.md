# dotfiles

My dotfiles.

## nix home-manager setup

- https://github.com/nix-community/home-manager

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install # for nixos
# OR
nix-env -iA nixpkgs.home-manager # for global install

# linux OR darwin at ~/.config/home-manager/flake.nix

home-manager init
home-manager build
home-manager switch
```

## .my-bashrc setup

```bash
if [ -f ~/.my-bashrc ]; then
    . ~/.my-bashrc
fi
```

## dot setup

```bash
git clone https://github.com/susonwaiba/my-bash-jazz.git ~/.config/my-bash-jazz
chmod +x ~/.config/my-bash-jazz/bin/*
```
