check_stow:
	@which stow >/dev/null 2>&1 || \
	(echo "Installing GNU Stow..." && \
	brew install stow)

all: check_stow
	stow --verbose --target=$$HOME --restow HOME

delete: check_stow
	stow --verbose --target=$$HOME --delete HOME

.PHONY: check_stow all delete

