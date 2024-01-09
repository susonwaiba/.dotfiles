{ config, pkgs, ... }:

let
	name = "Suson Waiba";
	email = "susonwaiba@gmail.com";
	githubUsername = "susonwaiba";
in {
	programs = {
		# home-manager = {
		# 	enable = true;
		# };
		bash = {
			enable = true;
			bashrcExtra = ''
				export VISUAL="nvim"
				export EDITOR=$VISUAL

				alias ls='ls --color=auto'
				alias grep='grep --color=auto'
				PS1='[\u@\h \W]\$ '

				# set -o vi

				export PATH="$PATH:$HOME/.local/bin"
				export PATH="$PATH:$HOME/.config/my-bash-jazz/bin";
				export PATH="$PATH:$HOME/.config/my-script/bin";

				if [ -f ~/.bash_aliases ]; then
					. ~/.bash_aliases
				fi
				if [ -f ~/.hidden-dotfiles/.bash_aliases ]; then
					. ~/.hidden-dotfiles/.bash_aliases
				fi
			'';
			shellAliases = {
				myName="echo ${name}";
				myEmail="echo ${email}";
				myWebSiteUrl="echo https://susonwaiba.github.io";
				myGithubUrl="echo https://github.com/susonwaiba";
			};
		};
		# zsh = {
		# 	enable = true;
		# };
		git = {
			enable = true;
			userName = "${name}";
			userEmail = "${email}";
		};
		direnv = {
			enable = true;
			nix-direnv = {
				enable = true;
			};
		};
	};

	services = {
	};
	
	home = {
		username = "suson";
		homeDirectory = "/home/suson"; # For Linux
		stateVersion = "23.05";
		packages = [
			pkgs.htop
			pkgs.btop
			pkgs.neofetch
			pkgs.nettools
			pkgs.bat
			pkgs.tmux
			pkgs.just
			pkgs.gnumake
			pkgs.sd
			pkgs.gcc
			pkgs.fzf
			pkgs.fd
			pkgs.jq
			pkgs.xclip
			pkgs.neovim
			pkgs.pass
			pkgs.lazygit
			pkgs.nodejs_20
			pkgs.yarn
			pkgs.sqlite
			pkgs.php83
			pkgs.php83Packages.composer
			pkgs.php83Packages.php-cs-fixer
			pkgs.php83Packages.phpmd
			pkgs.php83Extensions.pdo
			pkgs.php83Extensions.mysqli
			pkgs.php83Extensions.intl
			pkgs.php83Extensions.iconv
			pkgs.php83Extensions.sodium
			pkgs.php83Extensions.mbstring
			pkgs.php83Extensions.simplexml
			pkgs.php83Extensions.gd
			pkgs.php83Extensions.sqlite3
			pkgs.php83Extensions.redis
			pkgs.php83Extensions.mongodb
			pkgs.php83Extensions.curl
			pkgs.php83Extensions.zip
		];
	};
}