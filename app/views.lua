#!/usr/bin/tarantool
local views = {}
local log = require('log')
local json = require('json')

box.cfg {
    wal_dir = './logs/xlog_files',
    memtx_dir = './logs/snap_files',
    log_level = 5,
    slab_alloc_arena = 1,
}

function views.homepage(self)
    return self:render({isAuthorized=1})
end


return views