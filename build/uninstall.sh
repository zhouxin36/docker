#!/bin/bash

yum -y remove docker-ce docker-ce-cli containerd.io
rm -rf /var/lib/docker
rm -rf /etc/docker
rm -rf /usr/libexec/docker