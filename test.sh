#!/bin/bash

yamllint -c tests/yamllint.yml .

ansible-lint tests/role.yml

ansible-playbook tests/role.yml --syntax-check 
