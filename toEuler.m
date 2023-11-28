%{
Author: Dongheon Han
FREE Lab | 10/11/2023
Version 1
%}

function angles = toEuler(q)

    angles = zeros(3,1);

    % roll (x-axis rotation)
    sinr_cosp = 2 * (q(1,1) * q(2,1) + q(3,1) * q(4,1));
    cosr_cosp = 1 - 2 * (q(2,1) * q(2,1) + q(3,1) * q(3,1));
    angles(1,1) = atan2(sinr_cosp, cosr_cosp);

    % pitch (y-axis rotation)
    sinp = sqrt(1 + 2 * (q(1,1) * q(3,1) - q(2,1) * q(4,1)));
    cosp = sqrt(1 - 2 * (q(1,1) * q(3,1) - q(2,1) * q(4,1)));
    angles(2,1) = 2 * atan2(sinp, cosp) - pi / 2;

    % yaw (z-axis rotation)
    siny_cosp = 2 * (q(1,1) * q(4,1) + q(2,1) * q(3,1));
    cosy_cosp = 1 - 2 * (q(3,1) * q(3,1) + q(4,1) * q(4,1));
    angles(3,1) = atan2(siny_cosp, cosy_cosp);
end