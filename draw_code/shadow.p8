function draw_shadow(x, y, s)
    add_draw_inst_to_layer(
        function()
            fillp(▒)
            circfill(x, y, s, 3)
            fillp()
            circfill(x, y, s - 2, 3)
        end, 1
    )
end