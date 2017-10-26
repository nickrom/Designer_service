--
-- Created by IntelliJ IDEA.
-- User: user
-- Date: 27.10.17
-- Time: 0:03
-- To change this template use File | Settings | File Templates.
--
local generate_db = {}

local log = require('log')

local open = io.open

local function read_file(path)
    local file = open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end



function generate_db.clothes()
    local fileContent = read_file("./data/clothes/clothers.csv")
    return fileContent
end

function generate_db.designers()
    local fileContent = read_file("./data/designers/designers.csv")
    return fileContent
end

function generate_db.showrooms()
    local fileContent = read_file("./data/showrooms/showrooms.csv")
    return fileContent
end

return generate_db
