function result = modulation_PDM(s, qe)
    s_mod = zeros(1, length(s));
    for i = 1:length(s)
        qe = qe + s(i);

        if qe > 0 
            s_mod(i) = 1;
        else
            s_mod(i) = -1;
        end
        qe = qe - s_mod(i);
    end
    result = s_mod;
 end 

