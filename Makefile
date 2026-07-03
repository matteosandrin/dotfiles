DEST = ~/

.PHONY: install

# copies everyting in this repo that starts with a "." recursively (except fro .git and .gignore)
install:
	rsync -av --exclude='.git' --exclude='.gitignore' .[!.]* $(DEST)