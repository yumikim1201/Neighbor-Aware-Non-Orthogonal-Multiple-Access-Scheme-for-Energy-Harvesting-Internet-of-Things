function c = C(s_now,S_metrix,a)
    
    c = 0;

    now = ONEN(s_now,S_metrix);
    now_e = now(1);
        
    if now_e == 1 && a > 1
        c = 1;
    elseif now_e == 2 && a > 2
        c = 1;
    elseif now_e == 3 && a > 3
        c = 1;
    elseif now_e == 4 && a > 4
        c = 1;
    else
        c = 0;
    end
        
end