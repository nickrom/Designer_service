--
-- Created by IntelliJ IDEA.
-- User: user
-- Date: 11.10.17
-- Time: 16:42
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

if not box.space.showroom then
    s = box.schema.space.create('showroom')
    s:create_index('primary',
        {type = 'tree', unique=true, parts = {1, 'unsigned'}})
    s:create_index('name',
        {type = 'tree', parts = {2, 'string'}})
    s:create_index('email',
        {type = 'hash', parts = {3, 'string'}})
end

if not box.space.category then
    s = box.schema.space.create('category')
    s:create_index('primary',
        {type = 'tree', unique=true, parts = {1, 'unsigned'}})
    s:create_index('name',
        {type = 'tree', unique = false, parts = {2, 'string'}})
    s:create_index('parent',
        {type = 'tree', unique=false, parts = {3, 'unsigned'}})
end

if not box.space.item then
    s = box.schema.space.create('item')
    s:create_index('primary',
        {type = 'tree', unique=true, parts = {1, 'unsigned'}})
    s:create_index('name',
        {type = 'tree', unique=false, parts = {2, 'string'}})
    s:create_index('designer',
        {type = 'tree', unique=false, parts = {5, 'unsigned'}})
    s:create_index('category',
        {type = 'tree', unique=false, parts = {6, 'unsigned'}})
    s:create_index('showroom',
        {type = 'tree', unique=false, parts = {8, 'unsigned'}})
end

if not box.space.designer then
    s = box.schema.space.create('designer')
    s:create_index('primary',
        {type = 'tree', unique=true, parts = {1, 'unsigned'}})
    s:create_index('name',
        {type = 'tree', parts = {5, 'string'}})
    s:create_index('email',
        {type = 'hash', parts = {3, 'string'}})
end

if not box.space.sessions then
    s = box.schema.space.create('sessions')
    s:create_index('primary',
        {type = 'tree', unique=true, parts = {1, 'string'}})
    s:create_index('email',
        {type = 'hash', parts = {2, 'string'}})
    -- 1 - designer ; 2 - showroom
end

os.exit()