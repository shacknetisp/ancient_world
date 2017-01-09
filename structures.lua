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
