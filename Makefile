.PHONY: lint test coverage build clean upload all

lint:
	-ruff --fix src
	black src

test:
	python3 -m unittest discover

coverage:
	coverage run --source src -m unittest discover
	coverage report
	coverage html

build: src/gkeepapi/*.py
	python3 -m build

clean:
	rm -f dist/*.whl

upload:
	twine upload dist/*.whl

all: build upload
