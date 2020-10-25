[![Build Status](https://travis-ci.com/4babushkin/ansible-role-docker.svg?branch=main)](https://travis-ci.com/4babushkin/ansible-role-docker)

docker
======

This Ansible role enables people to install the latest Docker on an Ubuntu-like system. It also provides a handy library function to validate that the Docker daemon is running and functional.

Requirements
------------

This role will only work on an Ubuntu-like system.


Examples
--------

Install this module from Ansible Galaxy into the './roles' directory:
```bash
ansible-galaxy install -r requirements.yml
```
requirements.yml
```yml
- name: ansible-role-docker
  src: git+https://github.com/4babushkin/ansible-role-docker.git
  version: origin/main
```

Use it in a playbook as follows:
```yml
- hosts: all
  roles:
    - role: 'ansible-role-docker'
      become: true
  vars:
    docker_version_docker_compose: 1.27.4
    docker_user: "ubuntu"
    docker_additional_service_opts: |
      {
        "exec-opts": ["native.cgroupdriver=systemd"],
        "log-driver": "json-file",
        "log-opts": {
          "max-size": "100m"
        },
        "storage-driver": "overlay2"
        }
```
