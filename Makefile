DEST = ~/

.PHONY: install

# copies everything in this repo that starts with a "." recursively (except fro .git and .gitignore)
install:
	rsync -av --exclude='.git' --exclude='.gitignore' .[!.]* $(DEST)