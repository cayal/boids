function delta_v = flyToCenter( self_data, neighbor_data, rate )
% FLYTOCENTER(self_data,flock_data,rate) Returns delta-v required
%           for a boid to avoid any nearby flock members.
%    @input self_data Vector of a single boid's position and velocities
%    @input neighbor_data Vector of neighbor positions/velocities
%    @input rate The flightpath adjustment rate
%
%    @returns delta_v A vector representing necessary speed adjustment

delta_v = [0 0];
    if(size(neighbor_data, 1) > 0)
        perceived_center = [mean(neighbor_data(:,1)) mean(neighbor_data(:,2))];
        diff_to_center = (perceived_center - self_data(:,1:2));

        delta_v = diff_to_center * rate;
    end
end

