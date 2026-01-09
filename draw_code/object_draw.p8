function draw_tree(x, y, transparent)
   x = x - cam.x
   y = y - cam.y

   if x < -72 or y < -72 then return end
   if x > 72 or y > 72 then return end
   draw_shadow(x, y, 8)

   for i = 0, 5 do
      local move_multi = ((i / 16) + 1)
      local cols = { 2, 2, 1, 1, 1, 1 }
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

   for i = 5, 7 do
      local move_multi = ((i / 16) + 1)
      local cols = { 7, 3, 3 }
      local size = { 12, 10, 8 }
      local fillps = { "e", "d", "e"}
      add_draw_inst_to_layer(
         function()

            if fillps[i - 4] == "d" then
               fillp_odd_even()
            elseif fillps[i - 4] == "e" then
               fillp()
            end

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
      local cols = { 3,4,3,4,3 }
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

function draw_fog(x,y)
    local real_y = y
    local real_x = x
    local x = x - cam.x
    local y = y - cam.y

    local anim_x = cos(time()+(real_y/64))*4
    local anim_y = sin(time()+(real_x/64))*2

    if x < -90 or y < -90 then return end
    if x > 90 or y > 90 then return end

    add_draw_inst_to_layer(function() 
      fillp_odd_even()
      circfill(x+anim_x, y+anim_y, 12, 6)
      fillp()
      circfill(x+anim_x, y+anim_y, 8, 6) 
   end, #layers+1)
end