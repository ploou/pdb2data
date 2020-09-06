% pdb2data数据格式转换
%       4.01版本
%%%%=======================================================================
%   说明：
%   1.本代码可将packmol生成的氮气环境中的离子水溶液的.pdb文件转化成LAMMPS
%   可识别的data文件；
%   2.适用于氮气环境下，包含钠离子的、氯离子的水溶液，可以是两个独立的水滴；
%   3.在packmol中构建体系时，需严格遵循水分子1、钠离子、氯离子、氮气分子、
%   水分子2的顺序；
%   4.适用10000原子以上，10000分子以内的体系，若单一分子类型的数目超过10000
%   时，输入的.pdb数据存在问题；
%   5.版本2.0修改了粒子类型识别算法，能适用任意粒子类型和顺序的文件；
%   6.版本2.10纠正了势能参数epsilon的单位问题，通常文献中的参数是以KJ/mol，
%   须按照4.18KJ/mol = 1Kcal/mol转化；
%   7.版本3.01适应了分子数超过10000的体系；
%   8.版本4.01采用了全新的代码结构和转换算法，便于后续扩展其他类型的分子，
%   而且经简单测试转换速度有所提高。
%                                                       zy 2019/12/03
format long

initdata = InitializeData();
pdb = ReadPDB('./run packmol/SimulationSystem.pdb');
data = SetMoleculeInformation(initdata, pdb);
WriteData('data.SimulationSystem', data);
ScreenOutput(data);

clear initdata
clear pdb
clear data