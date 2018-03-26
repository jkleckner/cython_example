# shrubbery landscaping

PY27_ENV=py2.7
PY36_ENV=py3.6

.PHONY: test bigbuild bigclean biginstall biguninstall default py27build py27install py27uninstall py36build py36install py36uninstall

default:
	echo no default

test: bigclean biguninstall py27install
	python -c 'from landscaping.landscaping import test ; test()'

bigtest: bigclean biguninstall biginstall
	(source activate $(PY27_ENV) ; python -c 'from landscaping.landscaping import test ; test()')
	(source activate $(PY36_ENV) ; python -c 'from landscaping.landscaping import test ; test()')

bigclean:
	rm -rf */build
	rm -rf */dist
	rm -rf */.eggs
	rm -rf */*.egg-info
	find . -name '*.pyc' -print | xargs rm
	find . -name '*.so' -print | xargs rm
	find . -name '*.c' -print | xargs rm

biguninstall: py27uninstall py36uninstall

py36uninstall:
	rm -rf ~/miniconda2/envs/$(PY36_ENV)/lib/python3.6/site-packages/shrubbery*
	rm -rf ~/miniconda2/envs/$(PY36_ENV)/lib/python3.6/site-packages/landscaping*

py27uninstall:
	rm -rf ~/miniconda2/envs/$(PY27_ENV)/lib/python2.7/site-packages/shrubbery*
	rm -rf ~/miniconda2/envs/$(PY27_ENV)/lib/python2.7/site-packages/landscaping*

py27build:
	(cd shrubbery;   source activate $(PY27_ENV) ; python setup.py build ; python setup.py build ; python setup.py build_ext --inplace )
	(cd landscaping; source activate $(PY27_ENV) ; python setup.py build ; python setup.py build ; python setup.py build_ext --inplace )
py36build:
	(cd shrubbery;   source activate $(PY36_ENV) ; python setup.py build ; python setup.py build ; python setup.py build_ext --inplace )
	(cd landscaping; source activate $(PY36_ENV) ; python setup.py build ; python setup.py build ; python setup.py build_ext --inplace )

bigbuild: py36build py27build
#	find . -name '*.c' -print | xargs rm

py27install:
	(cd shrubbery;   source activate $(PY27_ENV) ; python setup.py install )
	(cd landscaping; source activate $(PY27_ENV) ; python setup.py install )
py36install:
	(cd shrubbery;   source activate $(PY36_ENV) ; python setup.py install )
	(cd landscaping; source activate $(PY36_ENV) ; python setup.py install )

biginstall: py36install py27install

