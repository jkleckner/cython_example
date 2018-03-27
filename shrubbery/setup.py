from setuptools import setup
from setuptools import Extension
from Cython.Build import cythonize

setup(
    name = 'shrubbery',
    version='1.0.0',
    author='Cython Demo',
    url='http://example.com',
    packages = ['shrubbery', ],
    ext_modules = cythonize(
        Extension("shrubbery.*", ["shrubbery/*.pyx"])
    ),
#    cmdclass = {'build_ext': build_ext},
    package_data = {
        'shrubbery': ['*.pxd']
    },
    include_package_data=True,
    setup_requires=[
        # Note bug noted here: https://github.com/cython/cython/issues/1953 might require cython < 0.26
        "cython >= 0.22.1",
    ],
    # Note that zip_safe needs to be false in order for the pxd files to be available to cython cimport
    zip_safe=False,
)
