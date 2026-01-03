function distance_to(x1,y1,x2,y2)
    return sqrt((x2-x1)^2 + (y2-y1)^2)
end

-- collision

function lerp(a, b, t)
    return a + (b - a) * t
end

function hitbox_collide(hitbox1, hitbox2, obj1, obj2)
    local x1, y1 = obj1.x + hitbox1.x, obj1.y + hitbox1.y
    local x2, y2 = obj2.x + hitbox2.x, obj2.y + hitbox2.y
    return x1 < x2 + hitbox2.w and x1 + hitbox1.w > x2 and y1 < y2 + hitbox2.h and y1 + hitbox1.h > y2
end

function make_hitbox(x, y, w, h)
    return {x=x, y=y, w=w, h=h}
end

function get_hash(x,y) 
    return x&-8 | y>>>8 & 0x.fff0
end