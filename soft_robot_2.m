clear, clc



for i = 1:600
    figure(i)               
    k = i * 0.05;
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