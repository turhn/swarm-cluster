# Docker Cluster Infrastructure

Creates and validates a proper Docker cluster.

## Features

- Swarm Master
- Swarm Nodes and Join to Swarm Master
- Jenkins Server
- Private Docker Registry
- Validate server state

## Prerequisites

- Docker >= v1.12
- Ruby and Ruby Bundler to run tests
- Python >= 2.6 to run Ansible
- Ansible >= 2.2 (Older versions will not work.)
- Ubuntu 16.04 Xenial (At least 2 servers.)

## How to run server specs

```
TARGET_HOST='192.168.33.10' bundle exec rspec spec/roles/swarm-master/server_spec.rb
TARGET_HOST='192.168.33.11' bundle exec rspec spec/roles/swarm-node/server_spec.rb
```

## How to provision a server

```
ansible-playbook -i hosts/test swarm-master.yml
```
