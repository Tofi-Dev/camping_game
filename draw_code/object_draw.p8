function draw_tree(x, y, transparent)
   x = x - cam.x
   y = y - cam.y

   if x < -72 or y < -72 then return end
   if x > 72 or y > 72 then return end
   draw_shadow(x, y, 8)

   for i = 0, 5 do
      local move_multi = ((i / 16) + 1)
      local cols = { 4, 4, 2, 2, 2, 2 }
      add_draw_inst_to_layer(
         function()
            if transparent then
               fillp_odd_even()
            end
            circfill(x * move_multi, y * move_multi, i + 2, cols[i + 1])
            fillp()
         end, i + 2
      )
   end

   for i = 5, 6 do
      local move_multi = ((i / 16) + 1)
      local cols = { 3, 11 }
      local size = { 12, 8 }
      add_draw_inst_to_layer(
         function()
            if transparent then
               fillp_odd_even()
            end
            circfill(x * move_multi, y * move_multi, size[i - 4], cols[i - 4])
            fillp()
         end, i + 2
      )
   end

end


function draw_rock(x,y)
    x = x - cam.x
    y = y - cam.y

    if x < -72 or y < -72 then return end
    if x > 72 or y > 72 then return end

    draw_shadow(x, y, 7)

    add_draw_inst_to_layer(function() spr(4, x-4, y-4) end, 1)
end

function draw_bush(x,y, transparent)
    x = x - cam.x
    y = y - cam.y

    if x < -72 or y < -72 then return end
    if x > 72 or y > 72 then return end

    draw_shadow(x, y, 11)
   for i = 0, 3 do
      local move_multi = ((i / 38) + 1)
      local cols = { 3,11,3,11,3 }
      local sizes = { 8,7,6,5,4}
      add_draw_inst_to_layer(
         function()
            local offset_x, offset_y = (i)%4, (i)&4
            if transparent then
               fillp_odd_even()
            end
            circfill(x * move_multi, y * move_multi, sizes[i + 1], cols[i + 1])
            fillp()
         end, i + 2
      )
   end
end