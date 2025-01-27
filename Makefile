check_stow:
	@which stow >/dev/null 2>&1 || \
	(echo "Installing GNU Stow..." && \
	brew install stow)

all: check_stow
	stow --verbose --target=$$HOME --restow HOME

internal: check_stow
	stow --verbose --target=/usr --restow usr

delete: check_stow
	stow --verbose --target=$$HOME --delete HOME
	stow --verbose --target=/usr --delete usr

.PHONY: check_stow all internal delete

