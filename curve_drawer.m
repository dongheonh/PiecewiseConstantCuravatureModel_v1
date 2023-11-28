%{
Author: Dongheon Han
FREE Lab | 10/11/2023
Version 1
%}

function point = curve_drawer(t, curveMatrix)
%% Modify the curve here

    x = curveMatrix(1,1) * t^3 + curveMatrix(2,1) * t^2 + curveMatrix(3,1) * t;
    y = curveMatrix(1,2) * t^3 + curveMatrix(2,2) * t^2 + curveMatrix(3,2) * t;
    z = curveMatrix(1,3) * t^3 + curveMatrix(2,3) * t^2 + curveMatrix(3,3) * t;

    % output
    point = [x,y,z]';
end