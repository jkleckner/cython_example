from distutils.core import setup
from distutils.core import Extension
# NOTE: setuptools will create an egg zip file and this will not extract the pxd files
# from setuptools import setup
# from setuptools import Extension
import os
from Cython.Build import cythonize

import shrubbery
print('######## shrubbery.__file__: ' + shrubbery.__file__)
print('######## os.path.dirname(shrubbery.__file__): ' + os.path.dirname(shrubbery.__file__))
shrubbery_include = os.path.dirname(shrubbery.__file__)
print('######## os.path.dirname(os.path.dirname(shrubbery.__file__)): ' + os.path.dirname(os.path.dirname(shrubbery.__file__)))
print('######## shrubbery_include: ' + shrubbery_include)

# sh = shrubbery.shrubbing.standard_shrubbery()
# print('width: %d length: %d' %( sh.width, sh.length))

setup(
    name = 'landscaping',
    version='1.0.0',
    author='Cython Demo',
    url='http://example.com',
    packages = ['landscaping', ],
    ext_modules = cythonize(
        Extension(
            "landscaping.*",
            ["landscaping/landscaping.pyx"],
            include_dirs=[shrubbery_include]
        )
    ),
    setup_requires=[
        # Note bug noted here: https://github.com/cython/cython/issues/1953 might require cython < 0.26
        "cython >= 0.22.1",
    ],
    include_package_data=True,
)
