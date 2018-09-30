#!/bin/bash

(vagrant destroy -f || true) && vagrant up && vagrant halt && vagrant up
