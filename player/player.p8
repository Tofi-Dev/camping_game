-- init

function player_init()
    player = {
        x = 64 * 8,
        y = 16 * 8,
        prev_x = x,
        prev_y = y,
        eyes_dir = 0,
        hitbox = make_hitbox(0, 0, 8, 8),
        tail_segs = {},
        step = 0,

        hp = 100
        
    }
end

--update

function player_update()

    player.prev_x = player.x
    player.prev_y = player.y
    if btn(0) then
        player.x = player.x - 0.75
        player.eyes_dir = rlerp(player.eyes_dir, 1, 0.25)
    end
    if btn(1) then
        player.x = player.x + 0.75
        player.eyes_dir = rlerp(player.eyes_dir, 3, 0.25)
    end

    check_axis_for_col("x")

    if btn(2) then
        player.y = player.y - 0.75
        player.eyes_dir = rlerp(player.eyes_dir, 4, 0.25)
    end
    if btn(3) then
        player.y = player.y + 0.75
        player.eyes_dir = rlerp(player.eyes_dir, 2, 0.25)
    end

    if player.prev_x != player.x or player.prev_y != player.y then
        add(player.tail_segs, {x = player.x, y = player.y, l=16})
        player.step = player.step + 1

        if player.step > 16 then
            sfx(01)
            player.step = 0
        end
        
        for i in all(player.tail_segs) do
            i.l = i.l - 1
            if i.l == 0 then
                del(player.tail_segs, i)
            end
        end
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
            for i in all(player.tail_segs) do
                circfill(i.x - cam.x, i.y - cam.y, (i.l/3)-1, 8)
            end
            circfill(player.x - cam.x, player.y - cam.y, 4, 9)
            circfill(player.x - cam.x, player.y - cam.y, 3, 8)

            local eyes_rot = (player.eyes_dir + 1) * 0.25
            local eye_pos = split"0.1,-0.1"
            
            for i in all(eye_pos) do
                circfill(player.x - cam.x + 4 * cos(eyes_rot + i), player.y - cam.y + 4 * sin(eyes_rot + i), 1, 0)
                pset(player.x - cam.x + 4 * cos(eyes_rot + i), player.y - cam.y + 4 * sin(eyes_rot + i), 11)
            end
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