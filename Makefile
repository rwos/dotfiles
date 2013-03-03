FILES=.bashrc .vimrc .wmii/

all:
	cp -R $(FILES) ~/
	@echo "source ~/.bashrc"

