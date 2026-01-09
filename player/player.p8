-- init

function player_init()
    player = {
        x = 64 * 8,
        y = 16 * 8,
        prev_x = x,
        prev_y = y,
        eyes_dir = 0,
        hitbox = make_hitbox(0, 0, 8, 8),

        hp = 100
        
    }
end

--update

function player_update()

    player.prev_x = player.x
    player.prev_y = player.y
    if btn(0) then
        player.x = player.x - 0.75
    end
    if btn(1) then
        player.x = player.x + 0.75
    end

    check_axis_for_col("x")

    if btn(2) then
        player.y = player.y - 0.75
    end
    if btn(3) then
        player.y = player.y + 0.75
    end

    check_axis_for_col("y")

    player.x = mid(player.x, 0, world_size * 8)
    player.y = mid(player.y, 0, world_size * 8)


    cam.x = lerp(cam.x, player.x, 0.125)
    cam.y = lerp(cam.y, player.y, 0.125)

end

--draw

function player_draw()
    draw_shadow(player.x - cam.x, player.y - cam.y, 8)
    add_draw_inst_to_layer(
        function()
            circfill(player.x - cam.x, player.y - cam.y, 4, 8)
            circfill(player.x - cam.x, player.y - cam.y, 3, 9)
        end, 2
    )
end

function check_axis_for_col(type)
    for i = 1, #objs do
        local obj = objs[i]
        if hitbox_collide(obj.hitbox, player.hitbox, obj, player) then
            if obj.hitbox.w == 0 and obj.hitbox.h == 0 then
                return
            end
            if type == "x" then
                player.x = player.prev_x
            else
                player.y = player.prev_y
            end
        end
    end
end