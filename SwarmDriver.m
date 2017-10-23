test_boids = randomBoids(90);

range = 1.8;
fov = 1.45*pi;
rate = 0.01;
compactness = 0.1;

h = plotBoids(test_boids);

for i=1:100
    
    test_boids = updateBoids(test_boids, range, fov, rate, compactness);
    set(h,'xdata',test_boids(:,1) ...
          ,'ydata',test_boids(:,2) ...
          ,'udata',test_boids(:,3) ...
          ,'vdata',test_boids(:,4) );
    
    % Include boid #11's neighbors to demonstrate FOV  
    
    neighb = getNeighbors(test_boids,range,fov);
    hold on
    boid11 = test_boids(11,:);
        X = boid11(:,1);
        Y = boid11(:,2);
        U = boid11(:,3);
        V = boid11(:,4);
    quiver(X,Y,U,V,'g^');
    neighb11n = test_boids(neighb{11}, :);
        X = neighb11n(:,1);
        Y = neighb11n(:,2);
        U = neighb11n(:,3);
        V = neighb11n(:,4);

    neighbors_red = quiver(X,Y,U,V,'rv');
    clf(neighbors_red);
    hold off

    pause(0.05);
    delete(neighbors_red);
end



% h = plotBoids(test_boids);
% 
% neighb = getNeighbors(test_boids,4,pi/3);
% 
% boid11 = test_boids(11,:);
%     X = boid11(:,1);
%     Y = boid11(:,2);
%     U = boid11(:,3);
%     V = boid11(:,4);
% quiver(X,Y,U,V,'g');
% 
% neighb11n = test_boids(neighb{11}, :);
%     X = neighb11n(:,1);
%     Y = neighb11n(:,2);
%     U = neighb11n(:,3);
%     V = neighb11n(:,4);
% 
% quiver(X,Y,U,V,'r');
% 
