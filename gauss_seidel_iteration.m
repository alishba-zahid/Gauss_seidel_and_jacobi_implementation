function [x, errors, percentage_diff] = gauss_seidel_iteration(A, b, x0, tol, max_iter)
    n = length(b);
    x = x0;
    errors = zeros(max_iter, 1);

    for k = 1:max_iter
        for i = 1:n
            temp = 0;
            for j = 1:n
                if j ~= i
                    temp = temp + A(i, j) * x(j);
                end
            end
            x(i) = (b(i) - temp) / A(i, i);
        end

        error = norm(A * x - b);
        errors(k) = error;

        if error < tol
            fprintf('Gauss-Seidel method converged in %d iterations.\n', k);
            errors = errors(1:k);
            break;
        end
    end

    if error >= tol
        fprintf('Gauss-Seidel method did not converge within the maximum number of iterations.\n');
    end

    initial_error = errors(1);
    final_error = errors(k);
    percentage_diff = ((initial_error - final_error) / initial_error) * 100;
end