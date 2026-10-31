.PHONY: install packages link preview recipes doctor test

STOW = stow --no-folding -t $(HOME)

# fresh machine: packages first (they bring stow), then links, then recipes (which read linked config)
install: packages link recipes

packages:
	@./scripts/apt

link:
	@$(STOW) home

# show what `make link` would do, including conflicts, without touching anything
preview:
	@$(STOW) -n -v home

recipes:
	@./scripts/recipes

doctor:
	@./scripts/doctor || true

test:
	@./scripts/test
