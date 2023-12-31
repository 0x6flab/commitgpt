.PHONY: lint
lint:
	ruff check commitgpt

.PHONY: test
test:
	poetry run coverage run --source=commitgpt -m pytest commitgpt/

.PHONY: coverage
coverage:
	poetry run coverage report -m

.PHONY: install-precommit
install-precommit:
	pre-commit install

.PHONY: precommit
precommit:
	pre-commit run --all-files -v

.PHONY: update-precommit
update-precommit:
	pre-commit autoupdate

release:
	# Don't forget to update the version in pyproject.toml
	standard-version
	git push --follow-tags origin main
