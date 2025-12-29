function y_sort(a)
    for i = 1, #a do
        local j = i
        while j > 1 and a[j - 1].y > a[j].y do
            a[j], a[j - 1] = a[j - 1], a[j]
            j = j - 1
        end
    end
end