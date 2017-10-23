function handle = plotBoids( flock_data )
% PLOTBOIDS(flock_data) Plot boids to a figure.
%   @input flock_data Position/velocities for the flock.
%   @returns handle A figure handle for the quiver plot of boids.

    figure
    
    X = flock_data(:,1);
    Y = flock_data(:,2);
    U = flock_data(:,3);
    V = flock_data(:,4);
    handle = quiver(X,Y,U,V,'o');
    xlim([0 10])
    ylim([0 10])
    
end


