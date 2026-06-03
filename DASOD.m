function fused_scores = DASOD(X,k)         % k超参数
    if istable(X), X = table2array(X); end
    X_discrete = equal_width(X, k);            
    formal_context = logical(create_formal_context(X_discrete)); 
    E1 = f_g(formal_context);
    E1(:, all(E1==0,1)) = [];
    E1(:, all(E1==1,1)) = [];
    [core_ext] = extract_core_concepts(E1);
    M_matrix = calculate_M(E1, core_ext); 
    N_matrix = compute_N(E1, core_ext, X_discrete, k);
    god = mean(M_matrix .* N_matrix, 2);
    ngof = NGOF(E1, god');
    [d3] = GPD_anomaly_detection(formal_context);
    fused_scores = d3.* ngof;
end