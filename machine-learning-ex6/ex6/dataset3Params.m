function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% Predefine Enum
C_vec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_vec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% Prepare variables
n = length(C_vec);
error_matrix = zeros(n, n);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

for i = 1:n
    for j = 1:n
        C_value = C_vec(i);
        sigma_value = sigma_vec(j);
        model = svmTrain(X, y, C_value, @(x1, x2) gaussianKernel(x1, x2, sigma_value));
        pred = svmPredict(model, Xval);
        error_matrix(i, j) = mean(double(pred ~= yval));
    end
end

[v, I] = min(error_matrix(:));
[I1,I2] = ind2sub(size(error_matrix),I);

C = C_vec(I1);
sigma = sigma_vec(I2);

% =========================================================================

end
