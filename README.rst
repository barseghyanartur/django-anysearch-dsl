====================
Django AnySearch DSL
====================

.. image:: https://github.com/django-anysearch/django-anysearch-dsl/actions/workflows/ci.yml/badge.svg
    :target: https://github.com/django-anysearch/django-anysearch-dsl/actions/workflows/ci.yml
.. image:: https://codecov.io/gh/django-anysearch/django-anysearch-dsl/coverage.svg?branch=master
    :target: https://codecov.io/gh/django-anysearch/django-anysearch-dsl
.. image:: https://badge.fury.io/py/django-anysearch-dsl.svg
    :target: https://pypi.python.org/pypi/django-anysearch-dsl
.. image:: https://readthedocs.org/projects/django-anysearch-dsl/badge/?version=latest&style=flat
    :target: https://django-anysearch-dsl.readthedocs.io/en/latest/

Django AnySearch DSL is a package that allows indexing of Django models in Elasticsearch/OpenSearch.
It is built as a thin wrapper around elasticsearch-dsl-py_ (and OpenSearch alternative).

You can view the full documentation at https://django-anysearch-dsl.readthedocs.io

.. _elasticsearch-dsl-py: https://github.com/elastic/elasticsearch-dsl-py
.. _django-elasticsearch-dsl: https://github.com/django-es/django-elasticsearch-dsl
.. _django-anysearch-dsl: https://github.com/django-anysearch/django-anysearch-dsl
.. _anysearch: https://github.com/barseghyanartur/anysearch
.. _changelog: https://github.com/django-anysearch/django-anysearch-dsl/blob/django-anysearch-dsl/CHANGELOG.rst

Manifest
--------

This project is a fork of django-elasticsearch-dsl_ with a single ultimate
purpose of supporting both Elasticsearch and OpenSearch. Compatibility is
achieved through anysearch_ which does necessary import replacements depending
on which one (Elasticsearch or OpenSearch) is chosen (similarly to what ``six``
package does to support both 2.x and 3.x branches of Python).

- Both ``elasticsearch`` and ``elasticsearch-dsl`` are optional
  dependencies (as well as ``opensearch-py`` and ``opensearch-dsl``) and are
  installed when instructed (like ``pip install django-anysearch-dsl[elasticsearch]``
  or ``pip install django-anysearch-dsl[opensearch]``).
- ``anysearch`` is a required dependency.

The plan is to stay in sync with the django-elasticsearch-dsl_, so if you're
missing a feature or have a bugfix, please propose it in the upstream.

- Submit PRs here only if they are solely related to this package and not
  the django-elasticsearch-dsl_.
- Do not propose code style changes or changes that contain reformatting
  of the code (like ``black`` or ``isort`` fixes). Such things shall be
  proposed in the django-elasticsearch-dsl_. Code changes to this package
  are kept minimal, so that it's easier to stay in sync.

Versioning is kept in sync up to the ``build`` (in terms of Semantic
versioning ``major.minor[.build[.revision]``), so version 7.2.2.x of this
library would represent the version 7.2.2 of the upstream. All changes
are mentioned in the changelog_.

This library is a drop-in replacement, it does have the same namespace as
``django-elasticsearch-dsl``, thus you can't have both installed.

Due to complexities, no support for older versions of Elasticsearch (< 7.x)
is provided (and will never be).

Features
--------

- Based on elasticsearch-dsl-py_ so you can make queries with the Search_ class.
- Django signal receivers on save and delete for keeping Elasticsearch in sync.
- Management commands for creating, deleting, rebuilding and populating indices.
- Elasticsearch auto mapping from django models fields.
- Complex field type support (ObjectField, NestedField).
- Index fast using `parallel` indexing.
- Requirements

   - Django >= 2.2
   - Python 3.6, 3.7, 3.8, 3.9, 3.10 or 3.10.

**Elasticsearch Compatibility:**
The library is compatible with Elasticsearch 7.x, OpenSearch 1.x and OpenSearch 2.x.

.. code-block:: python

    # Elasticsearch 7.x
    elasticsearch-dsl>=7.0.0,<8.0.0

    # OpenSearch 1.x
    opensearch-dsl>=1.0,<2.0

    # OpenSearch 2.x
    opensearch-dsl>=2.0,<3.0

.. _Search: http://elasticsearch-dsl.readthedocs.io/en/stable/search_dsl.html
