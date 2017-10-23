function delta_v = adjustVelocity( self_data, neighbor_data )
%FLYTOCENTER Adjust the velocity of a boid to try and approach the
%       center of mass of its neighbors
%   @input self_data The position/velocity of one boid
%   @input neighbor_data The position/velocity of that boid's neighbors
%
%    @returns delta_v A vector representing necessary speed adjustment

delta_v = [0 0];
    if(size(neighbor_data, 1) > 0)
        perceived_speed = [mean(neighbor_data(:,3)) mean(neighbor_data(:,4))];
        diff_to_speed = (perceived_speed - self_data(:,3:4));

        delta_v = diff_to_speed * 0.125;
    end
    
end