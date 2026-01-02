objs = {}

function game_draw()
    cls(11)

    layers={}

    for i = 1, #objs do
        local obj = objs[i]
        obj.draw()
    end
    player_draw()

    camera(-64,-64)

    map(0,0,-cam.x,-cam.y)

    draw_layers()

    camera(0,0)

    print(player.x, 0, 0, 7)
    print(player.y, 0, 8, 7)
end

function game_update()
    player_update()

    cam.x = mid(64, cam.x, 120*8)
    cam.y = mid(64, cam.y, 24*8)

    if btnp(4) then
        debug_draw = not debug_draw
    end
end

function game_init()
    debug_draw = false
    player_init()
    local world_size = 1000
    cam = {x=0, y=0}

    for i = 0, 128 do
        for j = 0, 32 do
            if mget(i, j) == 4 then
            add_rock(i*8, j*8)
            mset(i, j, 0)
            end
            if mget(i, j) == 5 then
            add_tree(i*8, j*8)
            mset(i, j, 0)
            end
            if mget(i, j) == 6 then
            add_bush(i*8, j*8)
            mset(i, j, 0)
            end
            if mget(i, j) == 0 then
                if rnd(5) >= 3 then
                mset(i, j, rnd(3))
                end
            end
        end
    end
end