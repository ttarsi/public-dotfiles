CONFIG_DIRS_LOCAL := $(wildcard dotfiles/.config/*)
CONFIG_DIRS_HOME := $(subst dotfiles, ~, $(CONFIG_DIRS_LOCAL))

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: stow
stow: ## Run stow to symlink dotfiles to home directory
	@mkdir -p $(CONFIG_DIRS_HOME)
	stow dotfiles --target $(HOME) --restow
	
.PHONY: unstow
unstow:  ## Remove stowed links
	stow --target $(HOME) -D dotfiles
