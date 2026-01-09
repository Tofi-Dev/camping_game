function draw_shiny_rect(x1, y1, x2, y2, c1, c2, c3)
    rectfill(x1, y1, x2, y2, c1)
    line(x1, y1, x2, y1, c2)
    line(x1, y2, x2, y2, c3)
end

function draw_gui()
    for i = 0, 3 do
        rrect(1+i*13,115, 12, 12, 3,11)
    end
    print("dAY:"..game.day, 2, 108, 11)
end