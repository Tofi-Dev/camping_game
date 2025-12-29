function draw_tree(x,y)
   if x < -72 or y < -72 then return end
   if x > 72 or y > 72 then return end
 add_draw_inst_to_layer(function() 
   circfill(x,y,6,1) 
end, 1)

 for i = 0, 5 do
    local move_multi = ((i/16)+1)
    local cols = {2,2,4,4,4,4}
    add_draw_inst_to_layer(function()
        circfill(x*move_multi,y*move_multi,i+2,cols[i+1])
    end, i+2)
 end

 for i = 5, 6 do
    local move_multi = ((i/16)+1)
    local cols = {3,11}
    local size = {12,8}
    add_draw_inst_to_layer(function()
        circfill(x*move_multi,y*move_multi,size[i-4],cols[i-4])
    end, i+2)
 end
end