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
				export NIXPKGS_ALLOW_UNFREE=1
				if [ -f ~/.my-bashrc ]; then
					. ~/.my-bashrc
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
		# homeDirectory = "/home/suson";
		homeDirectory = "/Users/suson"; # For MacOS
		stateVersion = "23.05";
		packages = [
		];
	};
}
