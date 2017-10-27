#!/bin/bash

rm -rf ./logs/snap_files/*.snap
rm -rf ./logs/xlog_files/*.xlog
tarantool ./db/init.lua
tarantool ./db/fill_data.lua
