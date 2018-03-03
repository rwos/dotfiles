FILES=bashrc vimrc gitconfig racketrc
DIRS=wmii vim

.PHONY: all $(FILES) $(DIRS) install gpg setup

all: $(FILES) $(DIRS) install gpg setup

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
	sudo apt-get install ntfs-3g iotop powertop lvm2
	# desktop utils
	sudo apt-get install kgpg \
		configure-trackpoint gksu \
	# desktop programs
	sudo apt-get install gimp chromium-browser
	# desktop dev stuff
	sudo apt-get install qtcreator qtquickcontrols2-5-dev qt5-default qtdeclarative5-dev

gpg:
	gpg --import < ~/.gnupg/secring.gpg
	gpg --import < ~/.gnupg/pubring.gpg

setup:
	sudo rm -f /etc/fonts/conf.d/70-no-bitmaps.conf
	sudo ln -s /etc/fonts/conf.d.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-no-bitmaps.conf
