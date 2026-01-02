function get_hash(x,y) 
 return x&-16 | y>>>16 & 0x.fff0
end

buckets={}
function add_to_buckets()
    for o in all(objects) do
    local hash = get_hash(o.x, o.y)
    if (not buckets[hash]) buckets[hash]={}
    add(buckets[hash], o)
    end
end