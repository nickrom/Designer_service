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
    local cookie = self:cookie('tarantool_id')
    local is_auth = box.space.sessions:select({cookie})
    if (table.getn(is_auth) ~= 0) then
        if (is_auth[1][3] == 1) then
            local designer = box.space.designer.index.email:select({is_auth[1][2]})
            return self:render({isAuthorized=1, name = designer[1][5], status=1, photo = designer[1][9]})
        else
            local showroom = box.space.showroom.index.email:select({is_auth[1][2]})
            log.info(showroom[1][8])
            return self:render({isAuthorized=1, name = showroom[1][2], status=2, photo = showroom[1][8][1]})
        end
    else
        return self:render({isAuthorized=0})
    end
end


return views