function constrained_nbrs = constrainToFOV( nearest_neighbors, flock_data , fov)
%CONSTRAINTOFOV Trim a collection of neighbors based on what the boid sees.
%   @input nearest_neighbors Cell array of nearest neighbors for each boid
%   @input flock_data The positions/velocities of the entire flock
%   @input fov The field of view, in radians, of each boid.
%
%   @returns constrained_nbrs The culled set of neighbors.
if(fov > 2*pi)
    error('Please give FOV in radians (max 2pi)');
end

% Preallocate output
constrained_nbrs = cell(numel(nearest_neighbors),1);

for i = 1:numel(nearest_neighbors)
    
    % nbr_data: flight data of nearest neighbors, probably including self
    nbr_data = flock_data(nearest_neighbors{i}(1:end), :);
    
    % self_data: flight data of boid #i
    self_data = flock_data(...
            nearest_neighbors{i}(nearest_neighbors{i} == i ...
        ), :);
    
    % normalized matrix of vectors to neighbors
    self_to_neighbors = normr(nbr_data(:,1:2) - self_data(:,1:2));
    self_view_norm = repmat(normr(self_data(:,3:4)), [size(self_to_neighbors,1) 1]);

    nbr_thetas = acos(dot(self_view_norm', self_to_neighbors'));
    
    constrained_nbrs{i} = nearest_neighbors{i}(nbr_thetas <= fov/2);
    
end


end

