function h_CharacterOut = MorphM(starting , final, hb, pause_n)


for k=0:1/6:1 %k fraction determines number of Morph steps (set to 1/6 now)
    
    if k > 0
        delete(h_final)
    end

	C = (1-k)*starting + k*final;
	
    h_final = scatter(hb, C(1,:),C(2,:), 'r.'); hold on
%     h_final = draw(C, draw_params);
   
    set(gca,'color','none','handlevisibility','off','visible','off')

	pause(pause_n);

end

h_CharacterOut = C;
end