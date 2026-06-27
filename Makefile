DEST = ~/

.PHONY: copy

# copies everyting in this repo that starts with a "." recursively (except fro .git and .gignore)
copy:
	rsync -av --exclude='.git' --exclude='.gitignore' .[!.]* $(DEST)