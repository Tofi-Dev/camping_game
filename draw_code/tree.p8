function draw_tree(x,y)
 add_draw_inst_to_layer(function() 
   circfill(x+64,y+64,6,1) 
end, 1)

 for i = 0, 5 do
    local move_multi = ((i/16)+1)
    add_draw_inst_to_layer(function()
        circfill(x*move_multi+64,y*move_multi+64,i+2,2)
    end, i+2)
 end

 for i = 5, 6 do
    local move_multi = ((i/16)+1)
    add_draw_inst_to_layer(function()
        circfill(x*move_multi+64,y*move_multi+64,i*2+2,3)
    end, i+2)
 end
end