objs = {}

function add_tree(x,y)
    add(objs, {
        x = x,
        y = y,
        draw = function()
            if distance_to(x,y,cam.x,cam.y) < 24 then  draw_tree(x,y,true) return end
            draw_tree(x,y,false)
        end
    })
end

function add_rock(x,y)
    add(objs, {
        x = x,
        y = y,
        draw = function()
            draw_rock(x,y)
        end
    })
end

function add_bush(x,y)
    add(objs, {
        x = x,
        y = y,
        draw = function()
            draw_bush(x,y)
        end
    })
end