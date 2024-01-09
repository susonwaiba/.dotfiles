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
				if [ -f ~/.bashrc ]; then
					. ~/.bashrc
				fi
				if [ -f ~/.bash_aliases ]; then
					. ~/.bash_aliases
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
		homeDirectory = "/Users/suson"; # For MacOS
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
			pkgs.nodejs
			pkgs.yarn
			pkgs.sqlite
			pkgs.php82
			pkgs.php82Packages.composer
			pkgs.php82Extensions.sqlite3
		];
	};
}
