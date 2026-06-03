function N_matrix = compute_N(all_ext, core_ext, discretized_data, k)
    [~, num_all] = size(all_ext);
    [~, num_core] = size(core_ext);
    [~, num_attr] = size(discretized_data);
    all_ext = logical(all_ext);
    core_ext = logical(core_ext);

    function intents = get_intents_fast(ext, data, n_attr)
        num_c = size(ext, 2);
        intents = zeros(num_c, n_attr);
        for j = 1:num_c
            idx = ext(:, j);
            if ~any(idx), continue; end
            sub = data(idx, :);
            v_min = min(sub, [], 1);
            v_max = max(sub, [], 1);
            common_mask = (v_min == v_max);
            intents(j, common_mask) = v_min(common_mask);
        end
    end
    N_all_vecs = get_intents_fast(all_ext, discretized_data, num_attr);
    N_core_vecs = get_intents_fast(core_ext, discretized_data, num_attr);
    N_matrix = ones(num_all, num_core) * k;
    
    mask_all = (N_all_vecs ~= 0);
    mask_core = (N_core_vecs ~= 0);
    for i = 1:num_all
        val_i = N_all_vecs(i, :);
        mi = mask_all(i, :);
        
        if ~any(mi), continue; end
        common_mask_all = mi & mask_core;
        has_any_common = any(common_mask_all, 2);
        if ~any(has_any_common), continue; end
        relevant_core = N_core_vecs(has_any_common, :);
        relevant_masks = common_mask_all(has_any_common, :);
        diffs = abs(val_i - relevant_core);
        diffs(~relevant_masks) = -1;
        max_diffs = max(diffs, [], 2);
        max_diffs(max_diffs == 0) = k/2;
        N_matrix(i, has_any_common) = max_diffs;
    end
end