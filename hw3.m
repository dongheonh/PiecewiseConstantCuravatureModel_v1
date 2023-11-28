%{ 
Author: Dongheon Han
Version: 1
ME4042_HW3
I worked on the homework assignment alone, using only course materials
%}
% Ref: https://javascript.info/bezier-curve
clear, clc
%% Bézier Curve 1
% Input vertices

p0 = [0 0];
p1 = [2 8];
p2 = [7 6];

figure();
syms t
    x = p0(1)*(1-t)^2 + p1(1)*2*(1-t) + p2(1)*t^2;
    y = p0(2)*(1-t)^2 + p1(2)*2*(1-t) + p2(2)*t^2;

fplot(x, y,[0,1],'b')
hold on



%% Bézier Curve 1
% Input vertices

p0 = [-5 -5];
p1 = [2 8];
p2 = [7 6];

p3 = [2 2];

figure();
syms t
x = p0(1)*(1-t)^3 + 3*p1(1)*t*(1-t)^2 + 3*p2(1)*(t^2)*(1-t) + p3(1)*(t^3);
y = p0(2)*(1-t)^3 + 3*p1(2)*t*(1-t)^2 + 3*p2(2)*(t^2)*(1-t) + p3(2)*(t^3);
fplot(x, y,[0,1],'b')
hold on

%% Bézier Curve 2
p0 = [-5 -5];
p1 = [2 8];
%p2 = [7 6];
p3 = p2;
p4 = p3;
syms t
x = p0(1)*(1-t)^4 + 4*p1(1)*t*(1-t)^3 + 6*p2(1)*(t^2)*(1-t)^2 + 4*p3(1)*(t^3)*(1-t) + p4(1)*(t^4);
y = p0(2)*(1-t)^4 + 4*p1(2)*t*(1-t)^3 + 6*p2(2)*(t^2)*(1-t)^2 + 4*p3(2)*(t^3)*(1-t) + p4(2)*(t^4);
fplot(x, y,[0,1], 'r')
xlim([p0(1)-5 p4(1)+5])
ylim([p0(2)-5 p4(2)+5])

plot(p0(1),p0(2),'k*'); plot(p1(1),p1(2),'k*'); plot(p2(1),p2(2),'k*'); 
plot(p3(1),p3(2),'k*'); plot(p4(1),p4(2),'k*');

l1 = line([-5, 2],[-5, 8]);     l1.LineStyle = '--';    l1.Color = 'k';
l2 = line([2, 7],[8, 6]);       l2.LineStyle = '--';    l2.Color = 'k';
l3 = line([7, 14],[6, 13]);     l3.LineStyle = '--';    l3.Color = 'k';

title('Dongheon Han *HW3')
legend('Curve 1','Curve 2','vertices')
hold off

