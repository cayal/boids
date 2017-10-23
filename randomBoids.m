function positions = randomBoids( flock_size )
%RANDOMBOIDS Generate a random swarm of boids facing (roughly)
%       toward the center of the stage.
%   @input flock_size The number of boids to generate.
     
     positions = zeros(5, 3);

     for i = 1:flock_size
        positions(i, 1) = 2 + rand() * 6;
        positions(i, 2) = 2 + rand() * 6;
        positions(i, 3) = -sign(positions(i, 1) - 5) * rand() * 0.2;
        positions(i, 4) = -sign(positions(i, 2) - 5) * rand() * 0.2;
     end
end

