DEST = $(HOME)
DOTFILES = $(filter-out . .. .git .gitignore, $(wildcard .*))

.PHONY: install

# recursively symlinks every file in this repo under a "." entry (except for
# .git and .gitignore). Directories are created for real in DEST
install:
	@for f in $$(find $(DOTFILES) -type f -o -type l); do \
		if [ -e $(DEST)/$$f ] && [ ! -L $(DEST)/$$f ]; then \
			echo "skipping $$f: $(DEST)/$$f exists and is not a symlink"; \
		else \
			mkdir -p $(DEST)/$$(dirname $$f); \
			ln -sfn $(CURDIR)/$$f $(DEST)/$$f; \
			echo "linked $(DEST)/$$f -> $(CURDIR)/$$f"; \
		fi \
	done
