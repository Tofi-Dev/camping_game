function draw_shadow(x, y, s)
    add_draw_inst_to_layer(
        function()
            fillp_odd_even()
            circfill(x, y, s, 7)
            fillp()
            circfill(x, y, s - 2, 7)
        end, 1
    )
end