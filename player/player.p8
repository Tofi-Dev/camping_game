-- init

function player_init()
    player = {
        x = 64*8,
        y = 16*8,
        prev_x = x,
        prev_y = y,
        eyes_dir = 0,
        hitbox = make_hitbox(0,0,8,8),
    }
end

--update

function player_update()

    buckets={}
    for o in all(objs) do
    local hash = get_hash(o.x, o.y)
    if (not buckets[hash]) buckets[hash]={}
    add(buckets[hash], o)
    end

    cam.x = player.x
    cam.y = player.y
    
    player.prev_x = player.x
    player.prev_y = player.y
    if (btn(0)) then
        player.x = player.x - 1
    end
    if (btn(1)) then
        player.x = player.x + 1
    end

    check_axis_for_col("x")

    if (btn(2)) then
        player.y = player.y - 1
    end
    if (btn(3)) then
        player.y = player.y + 1
    end

    check_axis_for_col("y")

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

function check_collisions(bucket, plr) 
  for o in all(bucket) do
    print(o.x, o.y)
    if (hitbox_collide(plr.hitbox, o.hitbox, plr, o)) return true
  end 
end

function check_axis_for_col(type)
    for dy=-1,1 do for dx=-1,1 do
        if check_collisions(buckets[get_hash(player.x + dx, player.y + dy)] or {}, player) == true then
            if type == "x" then player.x = player.prev_x end
            if type == "y" then player.y = player.prev_y end
            break
            end
        end
    end
end