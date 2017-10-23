function neighbors = getNeighbors( flock_data, range, fov )
% GETNEIGHBORS(flock_data,range,fov) Returns neighbors near a boid.
%       Neighbors are given by a radius range surrounding the boid,
%       intersected with a field of view.
%    @input flock_data Position/velocity data for the flock
%    @input range The radius around each boid to consider
%    @input fov Each boid's field of view, in radians
%
%    @returns neighbors A cell array representing neighbors for each boid

    X = flock_data(:,1:2);
    
    nearest_neighbors = rangesearch(X, X, range);
    
    % Constrain to the boid's FOV by passing neighbors and flock data
    fov_neighbors_and_self = constrainToFOV(nearest_neighbors, flock_data, fov);

    neighbors = cell(numel(fov_neighbors_and_self), 1);
    
    % Remove each boid from its own neighbor set
    for i=1:numel(fov_neighbors_and_self)
        row = fov_neighbors_and_self{i};
        neighbors{i} = row(row ~= i);
    end
        

end

