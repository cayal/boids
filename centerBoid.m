function delta_v = centerBoid( self_data, flock_data, compactness )
% CENTERBOID(self_data,flock_data,compactness) Returns delta-v required
%           for a boid to avoid any nearby flock members.
%    @input self_data Vector of a single boid's position and velocities
%    @input flock_data Vector of all other boid positions/velocities
%    @input compactness Parameter controlling size of boid personal space
%
%    @returns delta_v A vector representing necessary speed adjustment

dy = flock_data(:,2) - self_data(2);
dx = flock_data(:,1) - self_data(1);
closeBoids = flock_data(abs(hypot(dx, dy)) < compactness, :);
c  = [0 0];

for i = 1:size(closeBoids,1)
    c = c - (closeBoids(i,1:2) - self_data(1:2));
end

delta_v = c;

end

