%{
Author: Dongheon Han
FREE Lab | 10/11/2023
Version 1
%}

function point = curvature_curve_drawer(t, bezier)
%% Modify the curve here
% Quadratic Bézier curves
    p0 = bezier(1,:);
    p1 = bezier(2,:);
    p2 = bezier(3,:);
    p3 = bezier(4,:);



    y = 0;
    
    x = p0(1)*(1-t)^3 + 3*p1(1)*t*(1-t)^2 + 3*p2(1)*(t^2)*(1-t) + p3(1)*(t^3);
    z = p0(2)*(1-t)^3 + 3*p1(2)*t*(1-t)^2 + 3*p2(2)*(t^2)*(1-t) + p3(2)*(t^3);





    
    % output
    point = [x,y,z]';
end