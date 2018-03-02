FILES=bashrc vimrc gitconfig
DIRS=wmii vim

.PHONY: all $(FILES) $(DIRS) install

all: $(FILES) $(DIRS) install

$(FILES):
	cp -R "$@" "$(HOME)/.$@"

$(DIRS):
	rsync -a --progress "$@/" "$(HOME)/.$@/"

install:
	sudo apt-get install tree vim ctags vim-doc
