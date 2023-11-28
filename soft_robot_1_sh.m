%{
Author: Dongheon Han
FREE Lab | 10/11/2023
Version 1
%}

clear, clc

for i = 1:8
    figure(i)
    imu_proprioception(round(-5 + 10*rand(3,3)));
end

