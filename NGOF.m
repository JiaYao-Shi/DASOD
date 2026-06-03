function raw_scores = NGOF(E1, god)
    [n_obj, ~] = size(E1);                                         
    concept_sizes = sum(E1, 1);                                    
    weights = 1 - (concept_sizes / n_obj).^(1/3);                  
    weighted_god = god .* weights;
    numerator = E1 * weighted_god';                                
    denominator = sum(E1, 2);                                      
    denominator(denominator == 0) = 1;                            
    raw_scores = numerator ./ denominator;                         
end