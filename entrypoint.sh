#!/bin/bash
set -x

Xvfb :99 -screen 0 1024x768x16 &
winecfg 



