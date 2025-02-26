rows = input('Enter the number of rows of the matrix A: ');
cols = input('Enter the number of columns of the matrix A: ');

if rows ~= cols
    error('The matrix must be square (rows must equal columns) for these iterative methods.');
end

[A, b] = input_linear_system(rows, cols);

x0 = zeros(rows, 1);
tol = 0.001;
max_iter = 5000;

if ~check_diagonal_dominance(A)
   warning('The matrix A is not diagonally dominant. The iterative methods may not converge.');
end

[x_jacobi, errors_jacobi, percentage_diff_jacobi] = jacobi_iteration(A, b, x0, tol, max_iter);
[x_gauss_seidel, errors_gauss_seidel, percentage_diff_gauss_seidel] = gauss_seidel_iteration(A, b, x0, tol, max_iter);

fprintf('Percentage difference in error for Jacobi method: %.2f%%\n', percentage_diff_jacobi);
fprintf('Percentage difference in error for Gauss-Seidel method: %.2f%%\n', percentage_diff_gauss_seidel);

if length(errors_jacobi) < length(errors_gauss_seidel)
    fprintf('Jacobi method converged with fewer iterations.\n');
else
    fprintf('Gauss-Seidel method converged with fewer iterations.\n');
end
if percentage_diff_jacobi < percentage_diff_gauss_seidel
    fprintf('Jacobi method had a lesser percentage difference in error.\n');
else
    fprintf('Gauss-Seidel method had a lesser percentage difference in error.\n');
end
% Display error values for Jacobi method
fprintf('Jacobi method initial error: %.6f\n', errors_jacobi(1));
fprintf('Jacobi method final error: %.6f\n', errors_jacobi(end));

% Display error values for Gauss-Seidel method
fprintf('Gauss-Seidel method initial error: %.6f\n', errors_gauss_seidel(1));
fprintf('Gauss-Seidel method final error: %.6f\n', errors_gauss_seidel(end));

figure;
plot(1:length(errors_jacobi), errors_jacobi, 'b-', 'LineWidth', 2);
hold on;
plot(1:length(errors_gauss_seidel), errors_gauss_seidel, 'r--', 'LineWidth', 2);
hold off;
xlabel('Iteration');
ylabel('Error');
title('Error Convergence Comparison');
legend('Jacobi Iteration', 'Gauss-Seidel Method');
grid on;
