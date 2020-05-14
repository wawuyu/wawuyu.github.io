#!/bin/bash

# build
nohup hugo server --bind="0.0.0.0" -v -w -b https://www.tangyexinshichong.com --appendPort=false --watch --disableLiveReload  > blog.out &


