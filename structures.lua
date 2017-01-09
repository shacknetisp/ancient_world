-- Old guardtower/outpost upon desert sand.
ancient_world.register("ancient_world:ruin_desert_sand_1:desert_sand", {
    schematic = minetest.get_modpath("ancient_world") .. "/schematics/ruin_desert_sand_1.mts",
    type = "decoration",
    offset = {
        x = 0,
        y = -8,
        z = 0,
    },
    limit_y = {
        max = 31000,
        min = -8,
    },
    on = {"default:desert_sand"},
    random_replacements = {
        ["ancient_world:placeholder_1"] = true,
    },
})

-- Normal sand.
ancient_world.register("ancient_world:ruin_desert_sand_1:sand", {
    schematic = minetest.get_modpath("ancient_world") .. "/schematics/ruin_desert_sand_1.mts",
    type = "decoration",
    offset = {
        x = 0,
        y = -8,
        z = 0,
    },
    limit_y = {
        max = 31000,
        min = -8,
    },
    on = {"default:sand"},
    replacements = {
        ["default:desert_sand"] = "default:sand",
    },
    random_replacements = {
        ["ancient_world:placeholder_1"] = true,
    },
})

-- Silver sand.
ancient_world.register("ancient_world:ruin_desert_sand_1:silver_sand", {
    schematic = minetest.get_modpath("ancient_world") .. "/schematics/ruin_desert_sand_1.mts",
    type = "decoration",
    offset = {
        x = 0,
        y = -8,
        z = 0,
    },
    limit_y = {
        max = 31000,
        min = -8,
    },
    on = {"default:silver_sand"},
    replacements = {
        ["default:desert_sand"] = "default:silver_sand",
    },
    random_replacements = {
        ["ancient_world:placeholder_1"] = true,
    },
})

ancient_world.register("ancient_world:underground_hovel_1", {
    schematic = minetest.get_modpath("ancient_world") .. "/schematics/underground_hovel_1.mts",
    type = "decoration",
    limit_y = {
        max = -64,
        min = -31000,
    },
    on = {"default:stone"},
    random_replacements = {
        ["ancient_world:placeholder_1"] = true,
    },
})

ancient_world.register("ancient_world:underground_hovel_2", {
    schematic = minetest.get_modpath("ancient_world") .. "/schematics/underground_hovel_2.mts",
    type = "decoration",
    limit_y = {
        max = -64,
        min = -31000,
    },
    on = {"default:stone"},
})

if rawget(_G, 'kingdoms') then
    kingdoms.at_mod_load("magic", function()
        ancient_world.register("ancient_world:magic_hovel_1", {
            schematic = minetest.get_modpath("ancient_world") .. "/schematics/magic_hovel_1.mts",
            type = "decoration",
            limit_y = {
                max = -1024,
                min = -31000,
            },
            on = {"default:stone"},
            random_replacements = {
                ["ancient_world:placeholder_1"] = {"magic:nightcall", "magic:daypull"},
            },
        })
    end)
end

ancient_world.register("ancient_world:lava_mine", {
    schematic = minetest.get_modpath("ancient_world") .. "/schematics/lava_mine.mts",
    chance = 1,
    type = "decoration",
    on = {"default:lava_source"},
    replacements = {
        ["ancient_world:placeholder_1"] = "air",
    },
})

ancient_world.register("ancient_world:water_tower_1", {
    schematic = minetest.get_modpath("ancient_world") .. "/schematics/water_tower_1.mts",
    type = "decoration",
    on = {"default:water_source"},
    limit_y = {
        max = 16,
        min = -16,
    },
    offset = {
        x = 0,
        y = -23,
        z = 0,
    },
    replacements = {
        ["ancient_world:placeholder_2"] = "air",
    },
    random_replacements = {
        ["ancient_world:placeholder_1"] = true,
    },
})

if rawget(_G, 'kingdoms') then
    kingdoms.at_mod_load("magic", function()
        ancient_world.register("ancient_world:magic_hovel_2", {
            schematic = minetest.get_modpath("ancient_world") .. "/schematics/magic_hovel_2.mts",
            type = "decoration",
            on = {"default:dirt_with_grass"},
            offset = {
                x = 0,
                y = -3,
                z = 0,
            },
            random_replacements = {
                ["ancient_world:placeholder_1"] = true,
            },
        })
    end)
end

ancient_world.register("ancient_world:hidden_bush_1", {
    schematic = minetest.get_modpath("ancient_world") .. "/schematics/hidden_bush_1.mts",
    type = "decoration",
    on = {"default:dirt_with_grass"},
    random_replacements = {
        ["ancient_world:placeholder_1"] = true,
    },
})

if rawget(_G, 'kingdoms') then
    kingdoms.at_mod_load("magic", function()
        ancient_world.register("ancient_world:underground_lab_1", {
            schematic = minetest.get_modpath("ancient_world") .. "/schematics/underground_lab_1.mts",
            type = "decoration",
            limit_y = {
                max = -512,
                min = -31000,
            },
            offset = {
                x = 0,
                y = -16,
                z = 0,
            },
            on = {"default:stone"},
            replacements = {
                ["ancient_world:placeholder_2"] = "air",
            },
            random_replacements = {
                ["ancient_world:placeholder_1"] = true,
            },
        })
    end)
end

ancient_world.register("ancient_world:mine_1", {
    schematic = minetest.get_modpath("ancient_world") .. "/schematics/mine_1.mts",
    type = "decoration",
    on = {"default:dirt_with_grass", "default:dirt_with_dry_grass"},
    offset = {
        x = 0,
        y = -48,
        z = 0,
    },
    limit_y = {
        max = 8,
        min = -31000,
    },
    replacements = {
        ["ancient_world:placeholder_2"] = "air",
    },
    random_replacements = {
        ["ancient_world:placeholder_1"] = true,
        ["ancient_world:placeholder_3"] = (rawget(_G, 'kingdoms') and
                {"default:stone_with_gold", "default:stone_with_copper", "default:stone_with_iron", "kingdoms:stone_with_silver"} or
                {"default:stone_with_gold", "default:stone_with_copper", "default:stone_with_iron"}),
    },
})

ancient_world.register("ancient_world:meteor_1", {
    schematic = minetest.get_modpath("ancient_world") .. "/schematics/meteor_1.mts",
    type = "decoration",
    on = {"default:dirt_with_grass", "default:dirt_with_dry_grass"},
    offset = {
        x = 0,
        y = -2,
        z = 0,
    },
    limit_y = {
        max = 31000,
        min = -32,
    },
    replacements = {
        ["ancient_world:placeholder_1"] = "fire:basic_flame",
    },
    special = function(pos, mid, schematic_size)
        local want = {
            ["default:dirt_with_dry_grass"] = true,
            ["default:dirt_with_grass"] = true,
            ["default:stone"] = true,
        }
        local t = vector.add(mid, schematic_size)
        t.y = t.y - 4
        local positions = minetest.find_nodes_in_area(vector.subtract(mid, schematic_size), t, {"air"})
        if positions then
            for _,p in ipairs(positions) do
                if math.random(1, 100) <= 10 then
                    local hit = p
                    local tries = 1
                    while true do
                        hit = vector.add(hit, {x=0, y=-1, z=0})
                        if want[minetest.get_node(vector.add(hit, {x=0, y=-1, z=0})).name] then
                            break
                        end
                        if want[minetest.get_node(vector.add(hit, {x=0, y=-1, z=0})).name] == "ignore" then
                            hit = nil
                            break
                        end
                        if tries > 16 then
                            hit = nil
                            break
                        end
                        tries = tries + 1
                    end
                    if hit then
                        minetest.set_node(hit, {name="default:dirt"})
                    end
                end
            end
        end
    end,
})
