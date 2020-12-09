function h_CharacterOut = morphM(starting , final, draw_params)

    axes_handle = draw_params{1};
    color = draw_params{2};

for k=0:1/6:1 %k fraction determines number of Morph steps (set to 1/6 now)
    
    if k > 0
        delete(h_final)
    end

	C = (1-k)*starting + k*final;
	
    h_final = scatter(axes_handle, C(1,:),C(2,:), 4, color, 'square', 'filled'); hold off
%     h_final = draw(C, draw_params);
   
%     set(gca,'color','none','handlevisibility','off','visible','off')

	pause(0.1);

end

delete(h_final)
h_CharacterOut = C;
end