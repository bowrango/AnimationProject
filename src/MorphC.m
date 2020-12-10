%Morph your dude


%BE SURE TO RUN SIZEMATCH.m FIRST (conforms the sizes)

%% example:
%[Mario,Tflower] = SizeMatch(Mario,Tflower); %sets the same size
%new_Mario = MorphT(Mario,Tflower,hb); %does 6 stage morph

%% Actual Function
function h_CharacterOut = MorphC(starting , final, hb, pause_n)
for k=0:1/6:1 %k fraction determines number of Morph steps (set to 1/6 now)
    

    if k > 0
        delete(h_final)
    end

	C = (1-k)*starting + k*final;
%     C = scale(C, 2, 2);
%     h_final = draw(C);
    h_final = scatter(hb,C(1,:),C(2,:), 'r.');
    set(gca,'color','none','handlevisibility','off','visible','off')
	pause(pause_n);

end
delete(h_final);
h_CharacterOut = C;
end
