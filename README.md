# dotfiles

My dotfiles.

## nix

- https://github.com/nix-community/home-manager

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install # for nixos
nix-env -iA nixpkgs.home-manager # for global install

home-manager init
home-manager build
home-manager switch
```

## dot setup

```bash
git clone https://github.com/susonwaiba/my-bash-jazz.git ~/.config/my-bash-jazz
chmod +x ~/.config/my-bash-jazz/bin/*
```

## .bashrc

```bash
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.symfony5/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
```
