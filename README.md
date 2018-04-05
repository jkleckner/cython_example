# Importing Cython Definitions from Packaged Libraries

[![Build Status](https://travis-ci.org/jkleckner/cython_example.svg?branch=master)](https://travis-ci.org/jkleckner/cython_example)

This `cython_example` package is a minimalist attempt to create and install two cython packages
with a compiled dependency.  The [shrubbery](./shrubbery) package defines a `shrubbery.Shrubbery` class
that the [landscaping](./landscaping) package wants to include and subclass.

Thanks to Chris Barker for pointing out the `zip_safe=False` arugument to unzip the code so that
`cython cimport` will work.

This repository exists to demonstrate how to accomplish binary reuse.

Some relevant resource links:
* http://docs.cython.org/en/latest/src/reference/compilation.html#distributing-cython-modules
* http://docs.cython.org/en/latest/src/userguide/sharing_declarations.html#search-paths-for-definition-files
* http://setuptools.readthedocs.io/en/latest/setuptools.html#distributing-extensions-compiled-with-pyrex
* http://setuptools.readthedocs.io/en/latest/formats.html#code-and-resources
* http://setuptools.readthedocs.io/en/latest/setuptools.html#accessing-data-files-at-runtime
* http://peak.telecommunity.com/DevCenter/PythonEggs#accessing-package-resources

