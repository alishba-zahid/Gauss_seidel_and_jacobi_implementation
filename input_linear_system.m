function [A, b] = input_linear_system(rows, cols)
    disp(['Enter the elements of matrix A (', num2str(rows), ' by ', num2str(cols), '):']);
    A = zeros(rows, cols);
    for i = 1:rows
        row = input(['Enter elements of row ', num2str(i), ' (separated by spaces): ']);
        if length(row) ~= cols
            error('Number of elements in the row must match the number of columns.');
        end
        A(i, :) = row;
    end

    b = input(['Enter the elements of vector b (length ', num2str(rows), ', separated by spaces): ']);

    if length(b) ~= rows
        error('Size of vector b must match the number of rows of matrix A.');
    end
end
