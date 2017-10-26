--
-- Created by IntelliJ IDEA.
-- User: user
-- Date: 11.10.17
-- Time: 3:00
-- To change this template use File | Settings | File Templates.
--

local console = require('console')

box.cfg {
    wal_dir = './logs/xlog_files',
    memtx_dir = './logs/snap_files',
    log_level = 5,
    slab_alloc_arena = 1,
}

console.listen('127.0.0.1:33013')

if box.space.showroom then
    box.space.showroom:drop()
end

if box.space.item then
    box.space.item:drop()
end

if box.space.designer then
    box.space.designer:drop()
end

if box.space.category then
    box.space.category:drop()
end

if box.space.sessions then
    box.space.sessions:drop()
end

os.exit()