--
-- Created by IntelliJ IDEA.
-- User: user
-- Date: 11.10.17
-- Time: 3:06
-- To change this template use File | Settings | File Templates.
--

local console = require('console')
local log = require('log')
local gen = require('db.generate_db')

box.cfg {
    wal_dir = './logs/xlog_files',
    memtx_dir = './logs/snap_files',
    log_level = 5,
    slab_alloc_arena = 1,
}

console.listen('127.0.0.1:33013')

local function fill_showroom()
    local fileContent = gen.showrooms()
    local n = 0
    for line in string.gmatch(fileContent, '([^\n]+)') do
        local data = {}
        for d in string.gmatch(line, '([^;]+)') do
            if (d == 'id') then
                break
            end
            table.insert(data, d)
        end
        if (table.getn(data) ~= 0) then
            local showroom = {
                data[2],data[3],data[4],
                data[5],{data[6],data[7],data[8]}, data[9],
                {data[10],data[11],data[12]}
            }
            box.space.showroom:auto_increment(showroom)
        end
    end
end

local function fill_category()
    box.space.category:auto_increment { 'Женская одежда', 0 }
    box.space.category:auto_increment { 'Мужская одежда', 0 }
    box.space.category:auto_increment { 'Куртки и пальто', 1 }
    box.space.category:auto_increment { 'Платья и юбки', 1 }
    box.space.category:auto_increment { 'Штаны', 1 }
    box.space.category:auto_increment { 'Верхняя одежда', 1 }
    box.space.category:auto_increment { 'Аксессуары', 1 }
    box.space.category:auto_increment { 'Белье', 1 }
    box.space.category:auto_increment { 'Костюмы', 1 }
    box.space.category:auto_increment { 'Куртки и пальто', 2 }
    box.space.category:auto_increment { 'Штаны', 2 }
    box.space.category:auto_increment { 'Верхняя одежда', 2 }
    box.space.category:auto_increment { 'Белье', 2 }
    box.space.category:auto_increment { 'Костюмы', 2 }
    box.space.category:auto_increment { 'Аксессуары', 2 }
    box.space.category:auto_increment { 'Куртки', 3 }
    box.space.category:auto_increment { 'Пальто', 3 }
    box.space.category:auto_increment { 'Парки', 3 }
    box.space.category:auto_increment { 'Шубы', 3 }
    box.space.category:auto_increment { 'Бомберы', 3 }
    box.space.category:auto_increment { 'Ветровки', 3 }
    box.space.category:auto_increment { 'Короткие платья', 4 }
    box.space.category:auto_increment { 'Длинные платья', 4 }
    box.space.category:auto_increment { 'Юбки', 4 }
    box.space.category:auto_increment { 'Джинсы', 5 }
    box.space.category:auto_increment { 'Шорты', 5 }
    box.space.category:auto_increment { 'Брюки', 5 }
    box.space.category:auto_increment { 'Легинсы', 5 }
    box.space.category:auto_increment { 'Комбинезоны', 5 }
    box.space.category:auto_increment { 'Блузки', 6 }
    box.space.category:auto_increment { 'Джемперы', 6 }
    box.space.category:auto_increment { 'Кофты', 6 }
    box.space.category:auto_increment { 'Футболки', 6 }
    box.space.category:auto_increment { 'Майки', 6 }
    box.space.category:auto_increment { 'Кардиганы', 6 }
    box.space.category:auto_increment { 'Водолазки', 6 }
    box.space.category:auto_increment { 'Толстовки', 6 }
    box.space.category:auto_increment { 'Топы', 6 }
    box.space.category:auto_increment { 'Рубашки', 6 }
    box.space.category:auto_increment { 'Ремни', 7 }
    box.space.category:auto_increment { 'Заколки', 7 }
    box.space.category:auto_increment { 'Головные уборы', 7 }
    box.space.category:auto_increment { 'Перчатки', 7 }
    box.space.category:auto_increment { 'Сумки', 7 }
    box.space.category:auto_increment { 'Браслеты', 7 }
    box.space.category:auto_increment { 'Нижнее белье', 8 }
    box.space.category:auto_increment { 'Бюстгалтеры', 8 }
    box.space.category:auto_increment { 'Корсеты', 8 }
    box.space.category:auto_increment { 'Чулки', 8 }
    box.space.category:auto_increment { 'Пижамы', 8 }
    box.space.category:auto_increment { 'Носки', 8 }
    box.space.category:auto_increment { 'Строгие костюмы', 9 }
    box.space.category:auto_increment { 'Кэжуал', 9 }
    box.space.category:auto_increment { 'Куртки', 10 }
    box.space.category:auto_increment { 'Пальто', 10 }
    box.space.category:auto_increment { 'Парки', 10 }
    box.space.category:auto_increment { 'Ветровки', 10 }
    box.space.category:auto_increment { 'Джинсы', 11 }
    box.space.category:auto_increment { 'Шорты', 11 }
    box.space.category:auto_increment { 'Брюки', 11 }
    box.space.category:auto_increment { 'Комбинезоны', 11 }
    box.space.category:auto_increment { 'Повседневные штаны', 11 }
    box.space.category:auto_increment { 'Джемперы', 12 }
    box.space.category:auto_increment { 'Кофты', 12 }
    box.space.category:auto_increment { 'Футболки', 12 }
    box.space.category:auto_increment { 'Майки', 12 }
    box.space.category:auto_increment { 'Водолазки', 12 }
    box.space.category:auto_increment { 'Толстовки', 12 }
    box.space.category:auto_increment { 'Рубашки', 12 }
    box.space.category:auto_increment { 'Боксеры', 13 }
    box.space.category:auto_increment { 'Брифы', 13 }
    box.space.category:auto_increment { 'Строгие костюмы', 14 }
    box.space.category:auto_increment { 'Кэжуал', 14 }
    box.space.category:auto_increment { 'Ремни', 15 }
    box.space.category:auto_increment { 'Головные уборы', 15 }
    box.space.category:auto_increment { 'Перчатки', 15 }
    box.space.category:auto_increment { 'Сумки', 15 }
    box.space.category:auto_increment { 'Браслеты', 15 }
end

local function fill_designer()
    local fileContent = gen.designers()
    local n = 0
    for line in string.gmatch(fileContent, '([^\n]+)') do
        local data = {}
        for d in string.gmatch(line, '([^;]+)') do
            if (d == 'id') then
                break
            end
            table.insert(data, d)
        end
        if (table.getn(data) ~= 0) then
            local designer = {data[2],data[3],data[4],
                data[5],data[6],data[7],
                {data[9],data[10],data[11]}, data[8]
            }
            box.space.designer:auto_increment(designer)
        end
    end
end

local function fill_item()
    local fileContent = gen.clothes()
    local n = 0
    for line in string.gmatch(fileContent, '([^\n]+)') do
        local data = {}
        for d in string.gmatch(line, '([^;]+)') do
            if (d == 'id') then
                break
            end
            table.insert(data, d)
        end
        if (table.getn(data) ~= 0) then
            local item = {
                data[2], data[3], {tonumber(data[4]), tonumber(data[5]), tonumber(data[6]) }, tonumber(data[7]),
                tonumber(data[8]), tonumber(data[9]), tonumber(data[10]), tonumber(data[11]), tonumber(data[12]),
                { data[13], data[14], data[15] }
            }
            box.space.item:auto_increment(item)
        end
    end
end

fill_showroom()
fill_category()
fill_designer()
fill_item()

os.exit()