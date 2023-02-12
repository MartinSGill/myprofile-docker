#! /usr/bin/env bash

DEBIAN_FRONTEND=noninteractive

apt-get remove --purge -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" package-1 package-2 ... package-n
apt-get -y autoremove
apt-get clean all
