#!/usr/bin/tarantool
-- Tarantool init script
local api = {}
local log = require('log')
local json = require('json')
local uuid = require('uuid')
local ffi = require('ffi')

box.cfg {
    wal_dir = './logs/xlog_files',
    memtx_dir = './logs/snap_files',
    log_level = 5,
    slab_alloc_arena = 1,
}


function api.get_all_designers(self)
    local data = {
        designers = {},
        count = box.space.designer:len()
    }
    for k, d  in box.space.designer:pairs{} do
        table.insert(data.designers, {
            id = d[1],
            nickname = d[2],
            email = d[3],
            name = d[5],
            phone = d[6],
            about = d[7],
            photos = d[9]
        })
    end
    local resp = self:render({json = data})
    resp.headers['Access-Control-Allow-Origin'] = '*'
    resp.status = 200
    return resp
end

function api.get_all_showrooms(self)
    local data = {
        showrooms = {},
        count = box.space.showroom:len()
    }
    for k, d  in box.space.showroom:pairs{} do
        table.insert(data.showrooms, {
            id = d[1],
            name = d[2],
            email = d[3],
            about = d[5],
            city = d[6][1],
            street = d[6][2],
            house = d[6][3],
            phone = d[7],
            photos = d[8]
        })
    end
    local resp = self:render({json = data})
    resp.headers['Access-Control-Allow-Origin'] = '*'
    resp.status = 200
    return resp
end

function api.get_subcategories(p_id)
    local subs = box.space.category.index.parent:select(p_id)
    local data = {}
    if (table.getn(subs) ~= 0) then
        for k, s in pairs(subs) do
            table.insert(data, {
                id = s[1],
                name = s[2],
                categories = api.get_subcategories(s[1])
            })
        end
    end
    return data
end

function api.get_all_categories(self)
    local data = {
        categories = {},
        count = box.space.category:len()
    }
    for k, d  in box.space.category:pairs{} do
        if (d[3] == 0) then
            table.insert(data.categories, {
                id = d[1],
                name = d[2],
                categories = api.get_subcategories(d[1])
            })
        end
    end
    local resp = self:render({json = json.encode(data)})
    resp.headers['Access-Control-Allow-Origin'] = '*'
    resp.status = 200
    return resp
end

function api.get_all_items(self)
    local data = {
        items = {},
        count = box.space.item:len()
    }
    for k, d  in box.space.item:pairs{} do
        local designer = box.space.designer:select(d[5])
        local des_name = designer[1][5]
        local showroom = box.space.showroom:select(d[8])
        local sh_name = showroom[1][2]
        table.insert(data.items, {
            id = d[1],
            name = d[2],
            about = d[3],
            sizes = d[4],
            designer = des_name,
            category = d[6],
            des_price = d[7],
            showroom = sh_name,
            sw_price = d[9],
            status = d[10],
            photos = d[11]
        })
    end
    local resp = self:render({json = data})
    resp.headers['Access-Control-Allow-Origin'] = '*'
    resp.status = 200
    return resp
end

function api.add_designer(self)
    local data = self:json()
    log.info(data["id"])
    local ok = box.space.designer:auto_increment{data["nickname"], data["email"], data["password"],
        data["name"], data["phone"], data["about"], {data["address"]["city"], data["address"]["street"],
            data["address"]["house"] }, data["photos"]
    }
    if (ok) then
        local resp = self:redirect_to('/designer')
        resp.headers['Access-Control-Allow-Origin'] = '*'
        resp.status = 303
        local u_id = uuid()
        local s_id = ffi.string(u_id,  ffi.sizeof(u_id))
        box.space.sessions:insert{s_id, data["email"], 1 }
        return resp:setcookie({name = 'tarantool_id', value = s_id, expires = '+1y'})
    else
        return self:render({text = 'Registation error'})
    end
end

function api.add_showroom(self)
    local data = self:json()
    log.info(data)
    local ok = box.space.showroom:auto_increment{data["nickname"], data["email"], data["password"],
        data["about"], {data["address"]["city"], data["address"]["street"], data["address"]["house"]},
        data["phone"], data["photos"]
    }
    log.info(data)
    if (ok) then
        local resp = self:redirect_to('/designer')
        resp.headers['Access-Control-Allow-Origin'] = '*'
        resp.status = 303
        local u_id = uuid()
        local s_id = ffi.string(u_id,  ffi.sizeof(u_id))
        box.space.sessions:insert{s_id, {data["email"], 2 }}
        return resp:setcookie({name = 'tarantool_id', value = s_id, expires = '+1y'})
    else
        return self:render({text = 'Registation error'})
    end
end

function api.sign_in(self)
    local data = self:json()

    local ok = box.space.showroom.index.email:select(data["email"])
    if (ok[1]) then
        if (ok[1][4] == data["password"]) then
            local resp = self:redirect_to('/')
            resp.headers['Access-Control-Allow-Origin'] = '*'
            resp.status = 303
            local u_id = uuid()
            local s_id = ffi.string(u_id,  ffi.sizeof(u_id))
            box.space.sessions:insert{s_id, data["email"], 2 }
            return resp:setcookie({name = 'tarantool_id', value = s_id, expires = '+1y'})
        end
    end
    local ok = box.space.designer.index.email:select(data["email"])
    if (ok[1]) then
        if (ok[1][4] == data["password"]) then
            local resp = self:redirect_to('/')
            resp.headers['Access-Control-Allow-Origin'] = '*'
            resp.status = 303
            local u_id = uuid()
            local s_id = ffi.string(u_id,  ffi.sizeof(u_id))
            box.space.sessions:insert{s_id, data["email"], 1 }
            return resp:setcookie({name = 'tarantool_id', value = s_id, expires = '+1y'})
        end
    end
    return self:render({text = 'Failed'})
end

function api.log_out(self)
    local cookie = self:cookie('taarantool_id')
    box.space.sessions:truncate(cookie)
    local resp = self:redirect_to('/')
    resp.headers['Access-Control-Allow-Origin'] = '*'
    resp.status = 303
    return resp
end

return api