layers = {
}

function add_draw_inst_to_layer(func, layer)
    if layers[layer] == nil then
        layers[layer] = {}
    end
    add(layers[layer], func)
end

function draw_layers()
    for i = 1, #layers do
        for j = 1, #layers[i] do
            layers[i][j]()
            if debug_draw then
                flip()
            end
        end
    end
end