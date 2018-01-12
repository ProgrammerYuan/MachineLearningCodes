function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);
% Get sample numbers
m = size(X, 1);

% You need to return the following variables correctly.
idx = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

for i = 1:m
    idx_value = 1;
    dist_value = sum((centroids(1, :) - X(i, :)).^2);
    for j = 2:K
        dist_temp = sum((centroids(j, :) - X(i, :)).^2);
        if dist_temp < dist_value
            dist_value = dist_temp;
            idx_value = j;
        end
    end
    idx(i) = idx_value;
end






% =============================================================

end

