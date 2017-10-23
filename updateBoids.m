function flock_out = updateBoids( flock_data, range, fov, rate, compactness)
%UPDATEBOIDS(flock_data, range, fov, rate, compactness) Updates boids.
%       Ticks the simulation one timestep forward and returns updated flock
%       data.
%   @input flock_data The matrix of [x, y, u, v] for each boid.
%   @input range The distance to which boids consider neighbors.
%   @input fov The field of view of each boid in radians.
%   @input rate The speed at which boids try to flock.
%   @input compactness The size of each boid's personal space.
    
    neighbors = getNeighbors(flock_data, range, fov);
    flock_out = flock_data;

    for i = 1:size(flock_data,1)
        
        self_data = flock_data(i,:);
        flock_without_self_data = removerows(flock_data,'ind',i);
        nbr_data = flock_data(neighbors{i}, :);
        
        delta_v1 = flyToCenter(self_data, nbr_data, rate);
        delta_v2 = centerBoid(self_data, flock_without_self_data, compactness);
        delta_v3 = adjustVelocity(self_data, nbr_data);
        
        flock_out(i,3:4) = flock_out(i,3:4) + delta_v1 + delta_v2 + delta_v3;
        flock_out(i,1:2) = flock_out(i,1:2) + flock_out(i,3:4);

    end
    
    
    

end

