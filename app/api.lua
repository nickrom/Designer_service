#!/usr/bin/tarantool
-- Tarantool init script
local api = {}
local log = require('log')
local json = require('json')

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
            about = d[4],
            phone = d[6],
            photos = d[7]
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
    local data = box.space.item:select({})
    return self:render({json = data})
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
        local s_id = box.space.sessions:auto_increment{data["email"], 1 }
        return resp:setcookie({name = 'tarantool_id', value = s_id[1], expires = '+1y'})
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
        local s_id = box.space.sessions:auto_increment{data["email"], 1 }
        return resp:setcookie({name = 'tarantool_id', value = s_id[1], expires = '+1y'})
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
            local s_id = box.space.sessions:auto_increment{data["email"], 2 }
            return resp:setcookie({name = 'tarantool_id', value = s_id[1], expires = '+1y'})
        end
    end
    local ok = box.space.designer.index.email:select(data["email"])
    if (ok[1]) then
        if (ok[1][4] == data["password"]) then
            local resp = self:redirect_to('/')
            resp.headers['Access-Control-Allow-Origin'] = '*'
            resp.status = 303
            local s_id = box.space.sessions:auto_increment{data["email"], 1}
            return resp:setcookie({name = 'tarantool_id', value = s_id[1], expires = '+1y'})
        end
    end
    return self:render({text = 'Failed'})
end

return api