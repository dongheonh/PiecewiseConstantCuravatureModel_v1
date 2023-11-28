%{
Author: Dongheon Han
FREE Lab | 10/11/2023
Version 1
%}

function [gradient_xyz, seg_distance] = ...
    curve_dist_gradient_estimator...
    (new, old, delta_t, seg_distance)

    gradient_x = (new(1) - old(1))/delta_t;
    gradient_y = (new(2) - old(2))/delta_t;
    gradient_z = (new(3) - old(3))/delta_t;
            
    % output
    gradient_xyz = [gradient_x, gradient_y, gradient_z]'; 
    seg_distance = seg_distance + norm(new(:) - old(:));
end