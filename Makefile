
.PHONY: install install-packages install-all diff test

install:
	@./scripts/install

install-packages:
	@./scripts/install_packages -u

install-all: install-packages install

diff:
	@./scripts/diff

test:
	@./scripts/install test && tree -a test/ && rm -rf test/
