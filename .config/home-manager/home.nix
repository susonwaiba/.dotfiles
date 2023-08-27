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
			enableCompletion = true;
			bashrcExtra = ''
				export VISUAL="nvim"
				export EDITOR=$VISUAL

				set -o vi

				PATH="$PATH:$HOME/.config/my-bash-jazz/bin";
				PATH="$PATH:$HOME/.config/my-script/bin";

				if [ -f ~/.bash_aliases ]; then
					. ~/.bash_aliases
				fi
			'';
			shellAliases = {
				myName="echo ${name}";
				myEmail="echo ${email}";
				myWebUrl="echo https://suson.com.np";
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
		# homeDirectory = "/home/suson";
		homeDirectory = "/Users/suson"; # For MacOS
		stateVersion = "23.05";
		packages = [
			pkgs.htop
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
			pkgs.nodejs
			pkgs.yarn
			pkgs.sqlite
			pkgs.php82
			pkgs.php82Packages.composer
			pkgs.php82Extensions.sqlite3
		];
	};
}
