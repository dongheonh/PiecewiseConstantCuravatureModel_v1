%{
Author: Dongheon Han
FREE Lab | 10/11/2023
Version 1

%}

clear, clc
% p3: 7-9
p0 = [0 0];
p1 = [2 8];
p2 = [7 6];

v = VideoWriter('softrobot_curvature.avi');
open(v);

iter = 100;

ult_p_end = zeros(3,iter+1);
l_p_end = zeros(3,iter+1);
pcc_p_end = zeros(3,iter+1);

difference_l_ult = zeros(1,iter+1);
difference_pcc_ult = zeros(1,iter+1);
s_tuple = zeros(1,iter+1);
length_sg = [2, 2, 2, 2, 2, 2, 2, 2];

for i = 1:iter+1
    figure(i)
    s = (i-1)/iter;
    a = 7*s + 9*(1-s);
    p3 = [a  a];
    bezier = [p0; p1; p2; p3];
    [ult_p, l_p, pcc_p, numb_of_seg] = imu_proprioception_curvature(bezier, length_sg);
    
    ult_p_end(:,iter) = ult_p(:,numb_of_seg);
    l_p_end(:,iter) = l_p(:,numb_of_seg);
    pcc_p_end(:,iter)= pcc_p(:,numb_of_seg);
    
    difference_l_ult(i) = norm(ult_p_end(:,iter) - l_p_end(:,iter));
    difference_pcc_ult(i) = norm(ult_p_end(:,iter) - pcc_p_end(:,iter));

    s_tuple(i) = s;

    hold off 
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

figure()
plot(s_tuple, difference_l_ult,'.r')
hold on
plot(s_tuple, difference_pcc_ult,'.b')
[lf1, s1] = fit(s_tuple',difference_l_ult','poly3');
[lf2, s2] = fit(s_tuple',difference_pcc_ult','poly3');
plot(lf1, 'r')
plot(lf2, 'b')

legend('error of straight line', 'straight line regression', ...
    'error of constant curvature', 'constant curvature regression', 'Location','northwest')
title('100 iterations, 8 IMUs, chaging curvature (x), error (y)')
xlabel('curvature')
ylabel('error')
saveas(gcf,'iteration100')