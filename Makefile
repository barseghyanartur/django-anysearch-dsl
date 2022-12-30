.PHONY: help clean

define BROWSER_PYSCRIPT
import os, webbrowser, sys

from urllib.request import pathname2url

webbrowser.open("file://" + pathname2url(os.path.abspath(sys.argv[1])))
endef
export BROWSER_PYSCRIPT

BROWSER := python -c "$$BROWSER_PYSCRIPT"

help:
	@echo "clean | Remove all build, test, coverage and Python artifacts"
	@echo "clean-build | Remove build artifacts"
	@echo "clean-pyc | Remove Python file artifacts"
	@echo "clean-test | Remove test and coverage artifacts"
	@echo "run | Run the project in Docker"

clean: clean-build clean-pyc clean-test

clean-build:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf static/CACHE
	rm -rf builddocs/
	rm -rf builddocs.zip

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test:
	rm -rf .pytest_cache; \
	rm -rf .ipython/profile_default; \
	rm -rf htmlcov; \
	rm -rf build; \
	rm -f .coverage; \
	rm -f coverage.xml; \
	rm -f junit.xml; \
	rm -rf .hypothesis; \
	find . -name '*.py,cover' -exec rm -f {} +

test-elasticsearch:
	ANYSEARCH_PREFERRED_BACKEND=Elasticsearch python runtests.py

test-opensearch:
	ANYSEARCH_PREFERRED_BACKEND=OpenSearch python runtests.py

tox-elasticsearch:
	ANYSEARCH_PREFERRED_BACKEND=Elasticsearch tox -r

tox-opensearch:
	ANYSEARCH_PREFERRED_BACKEND=OpenSearch tox -r -c tox_opensearch.ini

release:
	python setup.py register
	python setup.py sdist bdist_wheel
	twine upload dist/* --verbose

build-docs:
	sphinx-build -n -a -b html docs/source builddocs
	cd builddocs && zip -r ../builddocs.zip . -x ".*" && cd ..

rebuild-docs:
	sphinx-apidoc django_elasticsearch_dsl --full -o docs -H 'django-anysearch-dsl' -A 'Artur Barseghyan <artur.barseghyan@gmail.com>' -f -d 20
