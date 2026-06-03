function M_matrix = calculate_M(E1, core_ext)
    E = double(logical(E1));
    C = double(logical(core_ext));
    notE = 1 - E;
    Term1 = (E' * E) * (notE' * C);
    Term2 = (E' * notE) * (E' * C);
    Numerator = Term1 + Term2;

    counts_all = sum(E, 1)'; 
    counts_core = sum(C, 1);
    Denominator = counts_all * counts_core;
    M_matrix = Numerator ./ (Denominator + eps);
end