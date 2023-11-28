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


iter = 10;

ult_p_end = zeros(3,iter+1);
l_p_end = zeros(3,iter+1);
pcc_p_end = zeros(3,iter+1);

difference_l_ult = zeros(1,iter+1);
difference_pcc_ult = zeros(1,iter+1);rng(2022);    % For repeatable results
s_tuple = zeros(1,iter+1);
%% 16 imus
length_sg = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

for i = 1:iter+1
    figure()
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

end

figure()
plot(s_tuple, difference_l_ult,'.r')
hold on
plot(s_tuple, difference_pcc_ult,'.b')
[lf1, s1] = fit(s_tuple',difference_l_ult','poly1');
[lf2, s2] = fit(s_tuple',difference_pcc_ult','poly1');
plot(lf1, 'r')
plot(lf2, 'b')

legend('error of straight line', 'straight line regression', 'error of constant curvature', 'constant curvature regression')
title('16 IMUs')
xlabel('curvature')
ylabel('error - end effector distance')


%% 8 imus
length_sg = [2, 2, 2, 2, 2, 2, 2, 2];

for i = 1:iter+1
    figure()
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

end

figure()
plot(s_tuple, difference_l_ult,'.r')
hold on
plot(s_tuple, difference_pcc_ult,'.b')
[lf1, s1] = fit(s_tuple',difference_l_ult','poly1');
[lf2, s2] = fit(s_tuple',difference_pcc_ult','poly1');
plot(lf1, 'r')
plot(lf2, 'b')

legend('error of straight line', 'straight line regression', 'error of constant curvature', 'constant curvature regression')
title('8 IMUs')
xlabel('curvature')
ylabel('error - end effector distance')


%% 4 imus
length_sg = [4, 4, 4, 4];

for i = 1:iter+1
    figure()
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

end

figure()
plot(s_tuple, difference_l_ult,'.r')
hold on
plot(s_tuple, difference_pcc_ult,'.b')
[lf1, s1] = fit(s_tuple',difference_l_ult','poly1');
[lf2, s2] = fit(s_tuple',difference_pcc_ult','poly1');
plot(lf1, 'r')
plot(lf2, 'b')

legend('error of straight line', 'straight line regression', 'error of constant curvature', 'constant curvature regression')
title('4 IMUs')
xlabel('curvature')
ylabel('error - end effector distance')
    
