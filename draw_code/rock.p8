function draw_rock(x,y)
    x = x - cam.x
    y = y - cam.y

    if x < -72 or y < -72 then return end
    if x > 72 or y > 72 then return end

    draw_shadow(x, y, 7)

    add_draw_inst_to_layer(function() spr(4, x-4, y-4) end, 1)
end