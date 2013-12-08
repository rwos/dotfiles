FILES=bashrc vimrc
DIRS=wmii vim

.PHONY: all $(FILES) $(DIRS)

all: $(FILES) $(DIRS)

$(FILES):
	cp -R "$@" "$(HOME)/.$@"

$(DIRS):
	rsync -a --progress "$@/" "$(HOME)/.$@/"

