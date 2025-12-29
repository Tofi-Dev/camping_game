trees = {

}

function game_draw()
    cls()

    layers={}

    for i=0,4 do
        for j=0,4 do
            local x,y = i*5*8, j*5*8
            camera(cam.x%40,cam.y%40)
            map(0,0,x,y,5,5)
            camera(0,0)
        end
    end

    for i = 1, #trees do
        local tree = trees[i]
        draw_tree(tree.x - cam.x, tree.y - cam.y)
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

    if cam.x > 200 then
        cam.x = 200
    end
    if cam.y > 200 then
        cam.y = 200
    end
    if cam.x < -200 then
        cam.x = -200
    end
    if cam.y < -200 then
        cam.y = -200
    end
end

function game_init()
    cam = {x=0, y=0}
    for i = 1,128 do
        add(trees, {x=rnd(400)-200, y=rnd(400)-200})
    end


end