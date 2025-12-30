objs = {}

function game_draw()
    cls(11)

    layers={}

    for i=0,4 do
        for j=0,4 do
            local x,y = i*5*8, j*5*8
            camera(cam.x%40,cam.y%40)
            map(0,0,x,y,5,5)
            camera(0,0)
        end
    end

    for i = 1, #objs do
        local obj = objs[i]
        obj.draw()
    end

    camera(-64,-64)

    draw_layers()

    camera(0,0)

    print(cam.x, 0, 0, 7)
    print(cam.y, 0, 8, 7)
end

function game_update()
    if (btn(0)) then
        cam.x = cam.x - 1
    end
    if (btn(1)) then
        cam.x = cam.x + 1
    end
    if (btn(2)) then
        cam.y = cam.y - 1
    end
    if (btn(3)) then
        cam.y  = cam.y + 1
    end

end

function game_init()
    local world_size = 1000
    cam = {x=0, y=0}
    for i = 1,400 do
        add(objs, add_tree(rnd(world_size)-world_size/2, rnd(world_size)-world_size/2))
    end

    for i = 1,400 do
        add(objs, add_rock(rnd(world_size)-world_size/2, rnd(world_size)-world_size/2))
    end


end