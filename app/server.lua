--
-- Created by IntelliJ IDEA.
-- User: user
-- Date: 11.10.17
-- Time: 16:39
-- To change this template use File | Settings | File Templates.
--

local log = require('log')
local console = require('console')
local server = require('http.server')
local views = require('views')

local api = require('api')

local HOST = '0.0.0.0'
local PORT = 8008

console.listen('0.0.0.0:33013')

box.cfg {
    wal_dir = './logs/xlog_files',
    memtx_dir = './logs/snap_files',
    log_level = 5,
    slab_alloc_arena = 1,
}

httpd = server.new(HOST, PORT)
httpd:route({method = 'GET', path = '/', file='index.html'}, views.homepage)
    :route({method = 'GET', path = '/signin', file='signin.html'})
    :route({method = 'GET', path = '/designer', file='designers.html'})
    :route({method = 'GET', path = '/get_designers'}, api.get_all_designers)
    :route({method = 'GET', path = '/get_designers'}, api.get_all_designers)
    :route({method = 'GET', path = '/showroom', file='showrooms.html'})
    :route({method = 'GET', path = '/get_showrooms'}, api.get_all_showrooms)
    :route({method = 'GET', path = '/signup_designer', file='signup_designer.html'})
    :route({method = 'GET', path = '/signup_showroom', file='signup_showroom.html'})
    :route({method = 'GET', path = '/category'}, api.get_all_categories)
    --:route({method = 'GET', path = '/category?'}, api.get_all_categories)
    :route({method = 'GET', path = '/items', file='items.html'})
    :route({method = 'GET', path = '/get_items'}, api.get_all_items)
    :route({method = 'GET', path = '/signin', file='signin.html'})

httpd:route({method = 'POST', path = '/designer' }, api.add_designer)
    :route({method = 'POST', path = '/showroom'}, api.add_showroom)
    :route({method = 'POST', path = '/signin'}, api.sign_in)
httpd:start()


