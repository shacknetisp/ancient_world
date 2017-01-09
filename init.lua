-- Function to execute more files.
local modpath = minetest.get_modpath("ancient_world")
local function domodfile(f)
    dofile(modpath .. '/' .. f)
end

-- Mod namespace.
ancient_world = {
    config = {},
    log = function() end,
}

if rawget(_G, 'kingdoms') then
    ancient_world.config = kingdoms.config_table("ancient_world")
    ancient_world.log = kingdoms.log_function("ancient_world")
end

function ancient_world.probability_list(t)
    local ret = {}
    for k,v in pairs(t) do
        for i=1,v do
            table.insert(ret, k)
        end
    end
    return ret
end

ancient_world.registered_items = {}
function ancient_world.register_item(name, probability)
    ancient_world.registered_items[name] = math.ceil((probability or 3) * 100)
end

local defaultitems = {
    ["default:mese"] = 1,
    ["default:diamondblock"] = 1,

    ["default:goldblock"] = 2,
    ["default:copperblock"] = 2,

    ["default:bronzeblock"] = 3,
    ["default:steelblock"] = 3,

    ["default:obsidian"] = 3,
    ["default:coalblock"] = 3,
}

for k,v in pairs(defaultitems) do
    ancient_world.register_item(k, v)
end

ancient_world.registry = {}
function ancient_world.register(name, def)
    local d = {
        chance = 0.5,
        offset = {x=0, y=0, z=0},
        limit_y = {max = 31000, min = -31000},
    }
    for k,v in pairs(def) do
        d[k] = v
    end
    ancient_world.registry[name] = d
end

domodfile("defaults.lua")
domodfile("dungeon.lua")
domodfile("structures.lua")

if rawget(_G, 'kingdoms') then
    ancient_world.log("action", "Loaded.")
    kingdoms.mod_ready("ancient_world")
end

minetest.register_on_generated(function(minp, maxp, seed)
    local items = ancient_world.probability_list(ancient_world.registered_items)
    for name,def in pairs(ancient_world.registry) do
        if math.random(1, 10000) <= (def.chance * 100) then
            local possible = {}
            if def.type == "decoration" then
                possible = minetest.find_nodes_in_area_under_air(
                    {x=minp.x, y=math.max(minp.y, def.limit_y.min), z=minp.z},
                    {x=maxp.x, y=math.min(maxp.y, def.limit_y.max), z=maxp.z},
                    def.on)
            elseif def.type == "embedded" then
                possible = minetest.find_nodes_in_area(
                    {x=minp.x, y=math.max(minp.y, def.limit_y.min), z=minp.z},
                    {x=maxp.x, y=math.min(maxp.y, def.limit_y.max), z=maxp.z},
                    def.inside)
            end
            if #possible > 0 then
                local r = table.copy(def.replacements or {})
                if def.random_replacements then
                    for k,v in pairs(def.random_replacements) do
                        if v == true then
                            r[k] = items[math.random(1, #items)]
                        else
                            r[k] = v[math.random(1, #v)]
                        end
                    end
                end
                local selected = possible[math.random(1, #possible)]
                local use = selected
                if def.down_to then
                    use = nil
                    local try = selected
                    for _=1,32 do
                        try.y = try.y - 1
                        if minetest.get_node(try).name == def.down_to then
                            use = try
                            break
                        end
                    end
                end
                if not use then
                    break
                end
                local pos = vector.add(use, def.offset)
                minetest.place_schematic(pos, def.schematic, "random")

                -- Very Hacky Solution due to minetest.place_schematic carrying the replacements parameter between calls.
                -- This parses the schematic file manually, then replaces appropriate nodes between all possible positions.
                local schematic_size = {}
                local sf = io.open(def.schematic, "rb")
                sf:read(6)
                schematic_size.x = string.byte(sf:read(1)) * 256 + string.byte(sf:read(1))
                schematic_size.y = string.byte(sf:read(1)) * 256 + string.byte(sf:read(1))
                schematic_size.z = string.byte(sf:read(1)) * 256 + string.byte(sf:read(1))
                sf:close()
                for k,v in pairs(r) do
                    local positions = minetest.find_nodes_in_area(vector.subtract(pos, schematic_size), vector.add(maxp, schematic_size), {k})
                    if positions then
                        for _,p in ipairs(positions) do
                            minetest.set_node(p, {name=v})
                        end
                    end
                end
                -- End Very Hacky Solution
            end
        end
    end
end)

for n=1,10 do
    minetest.register_node("ancient_world:placeholder_"..tostring(n), {
        description = "Placeholder "..tostring(n),
        tiles = {"default_cloud.png"},
        sounds = default.node_sound_stone_defaults(),
        groups = {cracky = 1, not_in_creative_inventory = 1},
    })
end
