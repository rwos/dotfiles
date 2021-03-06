SHELL=/bin/bash

FILES=bashrc vimrc gitconfig racketrc muttrc mailcap
DIRS=wmii vim

GH_REPOS=rwos/quake-online-thingy rwos/quakejs rwos/ioq3 rwos/gti \
	rwos/gifstopmotion rwos/rpterm rwos/xterm.js \
	rwos/fdcli rwos/hangouts-game rwos/website rwos/vagrant-cowsay-fortune \
	rwos/git-remind rwos/ludum-dare-26 rwos/sidescroll rwos/slacker \
	rwos/img2ascii rwos/ludum-dare-24 rwos/scrapyard rwos/minslide \
	rwos/processing_hacks rwos/powerplain rwos/voronoi-mandelbrot \
	rwos/render-brot rwos/newsqueak rwos/my_brain_hurts

BB_REPOS=rwos_/newshell rwos_/planeproject rwos_/exempli-gratia rwos_/rrpl \
	rwos_/doubleprec rwos_/semper rwos_/unix-utils rwos_/craysim rwos_/rterm

.PHONY: all $(FILES) $(DIRS) install gpg setup src sig

all: $(FILES) $(DIRS) sig
init: install gpg setup src
	@cat xkb.patch

$(FILES):
	cp -R "$@" "$(HOME)/.$@"

sig:
	cp sig "$(HOME)/sig"

$(DIRS):
	rsync -a --progress "$@/" "$(HOME)/.$@/"

install:
	sudo apt-add-repository ppa:linrunner/thinkpad-extras
	sudo apt-get update -y
	# basic stuff
	sudo apt-get install tree vim vim-gtk ctags vim-doc htop
	# useful utilities
	sudo apt-get install ntfs-3g iotop powertop lvm2 net-tools nmap
	# terminal dev stuff
	sudo apt-get install golang-1.9 gccgo-go racket indent splint slint jq
	# desktop utils
	sudo apt-get install kgpg \
		configure-trackpoint gksu \
	# desktop programs
	sudo apt-get install gimp chromium-browser
	# mail
	sudo apt-get install mutt msmtp-mta getmail4 urlview
	sudo apt-get purge kmail akonadi-server
	# etc
	go get -u -v github.com/ncw/rclone
	# desktop dev stuff
	sudo apt-get install qtcreator qtquickcontrols2-5-dev qt5-default qtdeclarative5-dev

gpg:
	gpg --import < ~/.gnupg/secring.gpg
	gpg --import < ~/.gnupg/pubring.gpg

setup:
	# X11 fonts
	sudo rm -f /etc/fonts/conf.d/70-no-bitmaps.conf
	sudo ln -s /etc/fonts/conf.d.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-no-bitmaps.conf
	# misc(fixed) that can be used by GTK/QT
	wget -q -O - 'https://github.com/pts/fonts/blob/master/fixedsc.tgz?raw=true' |  (cd / && sudo tar xzv)
	# /tmp as ramdisk
	sudo cp /usr/share/systemd/tmp.mount /etc/systemd/system/tmp.mount
	sudo systemctl enable tmp.mount
	sudo systemctl start tmp.mount

src:
	. ~/.bashrc
	cd ~/src && mkdir -p go/src
	git clone git@bitbucket.org:rwos_/code-hash.git ~/src/go/src/code-hash
	cd ~/src && (for r in $(GH_REPOS); do git clone git@github.com:$${r}.git || test -d `basename $$r`; done)
	cd ~/src && (for r in $(BB_REPOS); do git clone git@bitbucket.org:$${r}.git || test -d `basename $$r`; done)
