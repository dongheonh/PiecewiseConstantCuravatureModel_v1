%{
Author: Dongheon Han
FREE Lab | 10/11/2023
Version 1
link: https://www.mathworks.com/matlabcentral/answers/384848-get-figures-and-use-them-to-build-a-video-avi

%}

clear, clc

    i = 500               
    k = i * 0.05;
    curveMatrix_base = [k 2*k k; k k k; k k k]';
    imu_proprioception(curveMatrix_base)
    xlim([0 17])
    ylim([0 17])
    zlim([0 17])
    