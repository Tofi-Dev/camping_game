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