function fillp_odd_even()
    if (flr(cam.x) + flr(cam.y)) % 2 == 0 then
        fillp(0xa5a5.8)
    else
        fillp(0x5a5a.8)
    end
end

