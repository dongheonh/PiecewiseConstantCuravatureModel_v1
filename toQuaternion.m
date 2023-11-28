%{
Author: Dongheon Han
FREE Lab | 09/30/2023

change the coordinate represetation
from Euler to Quaternion
angle: radian

%}

function q = toQuaternion(angle)
    
    roll = angle(1,1);
    pitch = angle(2,1);
    yaw = angle(3,1);

    q = zeros(4,1);
    cr = cos(roll * 0.5);
    sr = sin(roll * 0.5);
    cp = cos(pitch * 0.5);
    sp = sin(pitch * 0.5);
    cy = cos(yaw * 0.5);
    sy = sin(yaw * 0.5);

    q(1,1) = cr * cp * cy + sr * sp * sy;
    q(2,1) = sr * cp * cy - cr * sp * sy;
    q(3,1) = cr * sp * cy + sr * cp * sy;
    q(4,1) = cr * cp * sy - sr * sp * cy;
end