function P_E = P_E(s_now,s_next,S_metrix,a,p_H)

    now = ONEN(s_now,S_metrix);
    next = ONEN(s_next,S_metrix);
    
    now_e = now(1);
    next_e = next(1);
    e_max = S_metrix(1);
    
    P_E = 0;
    
    if a == 1
        if now_e ~= e_max 
            if next_e == now_e + 1
                P_E = p_H;
            elseif next_e == now_e
                P_E = 1 - p_H;
            end
        else
            if next_e == now_e
                P_E = 1;
            end
        end
        
    elseif a == 2
        if now_e > 1
            if next_e == now_e
                P_E = p_H;
            elseif next_e == now_e - 1
                P_E = 1 - p_H;
            end
        else
            if next_e == now_e + 1
                P_E = p_H;
            elseif next_e == now_e
                P_E = 1 - p_H;
            end
        end 
  
    elseif a == 3
        if now_e > 2
            if next_e == now_e - 1
                P_E = p_H;
            elseif next_e == now_e - 2
                P_E = 1 - p_H;
            end
        else
            if next_e == now_e + 1
                P_E = p_H;
            elseif next_e == now_e
                P_E = 1 - p_H;
            end
        end 
        
    elseif a == 4
        if now_e > 3
            if next_e == now_e - 2
                P_E = p_H;
            elseif next_e == now_e - 3
                P_E = 1 - p_H;
            end
        else
            if next_e == now_e + 1
                P_E = p_H;
            elseif next_e == now_e
                P_E = 1 - p_H;
            end
        end
        
    elseif a == 5
        if now_e > 4
            if next_e == now_e - 3
                P_E = p_H;
            elseif next_e == now_e - 4
                P_E = 1 - p_H;
            end
        else
            if next_e == now_e + 1
                P_E = p_H;
            elseif next_e == now_e
                P_E = 1 - p_H;
            end
        end
        
    end

end