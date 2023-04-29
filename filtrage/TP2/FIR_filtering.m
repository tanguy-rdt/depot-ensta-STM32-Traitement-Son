function FIRfiltering = FIR_filtering(s, coeff)
    FIRfiltering = zeros(1, length(s));
     
    for k = 1:length(coeff)
        for i = 1:min(length(coeff),k)
            FIRfiltering(k) = FIRfiltering(k) + coeff(i)*s(k-i+1);
        end
    end
 
    
end