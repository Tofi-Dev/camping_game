objs = {}

function game_draw()
    cls(3)

    layers={}

    for i = 1, #objs do
        local obj = objs[i]
        obj.draw()
    end

    --draw fog at edges
    for i = 0, world_size do
        draw_fog(0, i*8)
        draw_fog(world_size*8, i*8)
    end

    for i = 0, world_size do
        draw_fog(i*8, 0)
        draw_fog(i*8, world_size*8)
    end

    player_draw()

    camera(-64,-64)

    for i =-2, 0 do
        for j = -2, 0 do
            map(0,0, (-cam.x%64)+i*64, (-cam.y%64)+j*64, 8,8)
        end
    end

    draw_layers()

    camera(0,0)

    print("objs:"..#objs, 0, 0, 11)
end

function game_update()
    player_update()

    cam.x = mid(64, cam.x, (world_size-8)*8)
    cam.y = mid(64, cam.y, (world_size-8)*8)

    if btnp(4) then
        debug_draw = not debug_draw
    end
end

function game_init()
    debug_draw = false
    player_init()
    world_size = 128
    cam = {x=0, y=0}

    generate_world(world_size)
end