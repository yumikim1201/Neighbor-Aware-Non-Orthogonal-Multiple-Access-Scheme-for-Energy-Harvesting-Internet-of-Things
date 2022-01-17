function  output = NONE (Nmetrix,Smetrix)
%  This function translates 3-Deminsion to 1-Deminsion
n_length = length(Nmetrix);
s_length = length(Smetrix);

value = 0;
for t = 1:1:n_length
    if (t ~= n_length)
        value= value + (Nmetrix(t)-1)*NONE_sub(t,Smetrix);
    else
        value = value + Nmetrix(t);
    end
%     (a-1)*Smetrix(2)*Smetrix(3)*Smetrix(4) + (b-1)*Smetrix(3)*Smetrix(4) + (c-1)*Smetrix(4) + e;
end

output = value;

end

function output_S = NONE_sub (s_i,Smetrix)
    s_l = length(Smetrix);
    value_s = 1;
    for j = s_i:1:s_l-1        
        value_s = value_s * Smetrix(j+1);
    end
    output_S = value_s;

end
