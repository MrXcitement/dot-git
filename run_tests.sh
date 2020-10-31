#!/bin/bash
# tests --- run static tests against this repository
# Mike Barker <mike@thebarkers.com>
# March 14th 2019

shellcheck {install,run_tests.sh}

# Listing the configuration will fail if there are format errors in the gitconfig file
# It does not check for valid settings, just valid formating.
git --no-pager config -f ./home/.gitconfig -l > /dev/null

