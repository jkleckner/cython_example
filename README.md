# Importing Cython Definitions from Packaged Libraries

[![Build Status](https://travis-ci.org/jkleckner/cython_example.svg?branch=master)](https://travis-ci.org/jkleckner/cython_example)

NOTE: I'm looking for help figuring out how to get this working with setuptools since other packages
distribute `egg zip` files that contain the `pxd` files required for inclusion.

This `cython_example` package is a minimalist attempt to create and install two cython packages
with a compiled dependency.  The [shrubbery](./shrubbery) package defines a `shrubbery.Shrubbery` class
that the [landscaping](./landscaping) package wants to include and subclass.

The challenge is in getting all of the `setup.py` machinery defined properly.

In addition the standard way of creating `egg` files which are `zip` archives
does not lend itself to being used in include paths.

This repository exists in order to have a concrete discussion about if and how to accomplish this reuse.

Some relevant resource links:
* http://docs.cython.org/en/latest/src/reference/compilation.html#distributing-cython-modules
* http://docs.cython.org/en/latest/src/userguide/sharing_declarations.html#search-paths-for-definition-files
* http://setuptools.readthedocs.io/en/latest/setuptools.html#distributing-extensions-compiled-with-pyrex
* http://setuptools.readthedocs.io/en/latest/formats.html#code-and-resources
* http://setuptools.readthedocs.io/en/latest/setuptools.html#accessing-data-files-at-runtime
* http://peak.telecommunity.com/DevCenter/PythonEggs#accessing-package-resources

`Egg` files can be used on the module path but can `cimport` be made to work with them?
