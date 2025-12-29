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

    draw_layers()
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
    cam = {x=0, y=0}
    for i = 1, 16 do
        add(trees, {x=rnd(384)-192, y=rnd(384)-192})
    end

    for i = 1, 4 do
        add(rocks, {x=rnd(384)-192, y=rnd(384)-192})
    end

end