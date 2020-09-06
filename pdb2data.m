% 运行packmol建模与data文件生成

%%%%=======================================================================
%   说明：
%   1.本代码调用CMD窗口,运行安装在Windows下的packmol.exe，然后调用数据转换
%   函数pdb2data.m转换数据格式；
%   2.以！开头的为cmd命令,cd()函数与dos下的cd命令相同。
%                                                       zy 2018/12/05
%%%%=======================================================================

clc,clear
% calling packmol.exe
cd('./run packmol')
! packmol < SimulationModel.inp 
cd('../')
% calling 'Main.m'
t = cputime;
Main
fprintf('Total consuming cpu time is %.2f second.\n', cputime-t)

