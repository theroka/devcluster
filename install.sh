#!/bin/bash

mkdir vm
mkdir build

vagrant destroy dev
vagrant up dev --provision
