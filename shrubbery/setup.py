from distutils.core import setup
from distutils.core import Extension
# NOTE: setuptools will create an egg zip file and this will not extract the pxd files
# from setuptools import setup
# from setuptools import Extension
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
)
