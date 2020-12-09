function h_CharacterOut = colormorphM(starting , final, starting_params, final_params)

    handle1 = starting_params{1};
    handle2 = final_params{1};
    if ~eq(handle1, handle2)
        error('not scattering to same plot')
    end
 
    color_start = starting_params{2};
    color_end = final_params{2};
    
    r = linspace(color_start(1), color_end(1), 7);
    g = linspace(color_start(2), color_end(2), 7);
    b= linspace(color_start(3), color_end(3), 7);
    
    color_vec = cell(1, 7);
    for c = 1:7
        color_vec{c} = [r(c) g(c) b(c)];
    end

    counter = 1;
for k=0:1/6:1 %k fraction determines number of Morph steps (set to 1/6 now)
    
    if k > 0
        delete(h_final)
    end

	C = (1-k)*starting + k*final;
	
    h_final = scatter(handle1, C(1,:),C(2,:), 4, color_vec{counter}, 'square', 'filled'); hold off
    counter = counter + 1;

	pause(0.1);

end

delete(h_final)
h_CharacterOut = C;
end