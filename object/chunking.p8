function get_hash(x,y) 
 return x&-16 | y>>>16 & 0x.fff0
end
