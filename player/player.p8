-- init

function player_init()
    player = {
        x = 64 * 8,
        y = 16 * 8,
        prev_x = x,
        prev_y = y,
        eyes_dir = 0,
        hitbox = make_hitbox(0, 0, 8, 8)
    }
end

--update

function player_update()

    player.prev_x = player.x
    player.prev_y = player.y
    if btn(0) then
        player.x = player.x - 1
    end
    if btn(1) then
        player.x = player.x + 1
    end

    check_axis_for_col("x")

    if btn(2) then
        player.y = player.y - 1
    end
    if btn(3) then
        player.y = player.y + 1
    end

    check_axis_for_col("y")


    cam.x = player.x
    cam.y = player.y

end

--draw

function player_draw()
    add_draw_inst_to_layer(
        function()
            circfill(player.x - cam.x, player.y - cam.y, 4, 2)
            circfill(player.x - cam.x, player.y - cam.y, 3, 8)
        end, 1
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