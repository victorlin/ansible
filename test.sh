#!/bin/bash
set -xe

if [ "$TEST_SUITE" -eq "units" ]; then
	pip install paramiko PyYAML jinja2 httplib2 passlib
    nosetests test/units -sv --with-coverage
    pip install flake8 --use-mirrors
    flake8 lib/ansible --ignore=E501,E221,W293
    flake8 test/units --ignore=E501,E221,W293
else
    cd test/integration
    make non_destructive
fi
