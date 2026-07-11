DEST = $(HOME)

.PHONY: install

# recursively symlinks every file in this repo under a "." entry (except for
# .git and .gitignore). Directories are created for real in DEST
install:
	chmod +x ./install.sh
	./install.sh $(DEST)
