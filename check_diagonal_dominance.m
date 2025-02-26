function [is_diagonally_dominant] = check_diagonal_dominance(A)
    % Check if the matrix A is diagonally dominant
    n = size(A, 1);
    is_diagonally_dominant = true;
    for i = 1:n
        row_sum = sum(abs(A(i, :))) - abs(A(i, i));
        if abs(A(i, i)) <= row_sum
            is_diagonally_dominant = false;
            break;
        end
    end
end