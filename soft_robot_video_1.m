%{
Author: Dongheon Han
FREE Lab | 10/11/2023
Version 1
link: https://www.mathworks.com/matlabcentral/answers/384848-get-figures-and-use-them-to-build-a-video-avi

%}

clear, clc

v = VideoWriter('softrobot.avi');
open(v);

for i = 1:200
    figure(i)               
    k = i * 0.1;
    curveMatrix_base = [0 0 k; 0 0 0; 0 2 0]';
    imu_proprioception(curveMatrix_base)
    xlim([0 17])
    ylim([-3 3])
    zlim([0 17])
    hold off 
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);