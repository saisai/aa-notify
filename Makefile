.PHONY: build test package clean

build:
	poetry install

test:
	poetry run aa-notify --help  # Ensures that it at least starts
	make typecheck

typecheck:
	poetry run mypy aa_notify --ignore-missing-imports

PYFILES=$(shell find . -type f -name '*.py')

format:
	black ${PYFILES}

package:
	pyinstaller aa-notify.spec --clean --noconfirm

clean:
	rm -rf build dist
	rm -rf aa_notify/__pycache__
