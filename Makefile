FILES=bashrc vimrc gitconfig
DIRS=wmii vim

.PHONY: all $(FILES) $(DIRS) install gpg

all: $(FILES) $(DIRS) install gpg

$(FILES):
	cp -R "$@" "$(HOME)/.$@"

$(DIRS):
	rsync -a --progress "$@/" "$(HOME)/.$@/"

install:
	sudo apt-add-repository ppa:linrunner/thinkpad-extras
	sudo apt-get update -y
	# basic stuff
	sudo apt-get install tree vim ctags vim-doc htop
	# useful utilities
	sudo apt-get install ntfs-3g
	# desktop utils
	sudo apt-get install kgpg \
		configure-trackpoint gksu \
	# desktop programs
	sudo apt-get install gimp

gpg:
	gpg --import < ~/.gnupg/secring.gpg
	gpg --import < ~/.gnupg/pubring.gpg
