objs = {}

function add_tree(x,y)
    add(objs, {
        x = x,
        y = y,
        hitbox = make_hitbox(0,0,4,4),
        draw = function()
            if distance_to(x,y,player.x,player.y) < 16 then  draw_tree(x,y,true) return end
            draw_tree(x,y,false)
        end
    })
end

function add_rock(x,y)
    add(objs, {
        x = x,
        y = y,
        hitbox = make_hitbox(0,0,8,8),
        draw = function()
            draw_rock(x,y)
        end,
    })
end

function add_bush(x,y)
    add(objs, {
        x = x,
        y = y,
        hitbox = make_hitbox(0,0,0,0),
        draw = function()
            if distance_to(x,y,player.x,player.y) < 16 then  draw_bush(x,y,true) return end
            draw_bush(x,y)
        end
    })
end