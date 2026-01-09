function generate_world(world_size)
    for i = 0, 80 do
        add_tree(rnd(world_size*8), rnd(world_size*8))
        add_rock(rnd(world_size*8), rnd(world_size*8))
        add_bush(rnd(world_size*8), rnd(world_size*8))
    end
end