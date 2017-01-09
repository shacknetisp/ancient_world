local function place_item(tab)
    local items = ancient_world.probability_list(ancient_world.registered_items)
    local pos = tab[math.random(1, (#tab or 4))]
    pos.y = pos.y - 1
    local n = core.get_node_or_nil(pos)
    if n and n.name ~= "air" then
        pos.y = pos.y + 1
        local name = items[math.random(1, #items)]
        core.set_node(pos, {name = name})
    end
end

core.set_gen_notify("dungeon")
core.register_on_generated(function(minp, maxp, blockseed)
    local ntf = core.get_mapgen_object("gennotify")
    if ntf and ntf.dungeon and #ntf.dungeon > 0 then
        core.after(3, place_item, table.copy(ntf.dungeon))
        if math.random(1, 100) < 25 then
            core.after(3, place_item, table.copy(ntf.dungeon))
        end
        if math.random(1, 100) < 25 then
            core.after(3, place_item, table.copy(ntf.dungeon))
        end
    end
end)
