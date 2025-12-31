-- init

function player_init()
    player = {
        x = 0,
        y = 0
    }
end

--update

function player_update()
    if (btn(0)) then
        player.x = player.x - 1
    end
    if (btn(1)) then
        player.x = player.x + 1
    end
    if (btn(2)) then
        player.y = player.y - 1
    end
    if (btn(3)) then
        player.y = player.y + 1
    end

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