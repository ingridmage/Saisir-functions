function [ZSaisir]=LoadFromUnscrambler(DirNameData,Filename);
%LoadFromUnscrambler 		- loads a unscrambler matlab and puts it to a
% saisir structure
% usage: [ZSaisir]=LoadFromUnscrambler(DirNameData,Filename); 
% ZSaisir is saisir structure 
% DirNameData contains / at the end
% Filename is the file name of the unscr. matlab file
% 

NameSaisir=strcat(DirNameData,Filename);
% load the matlab file saved by Unscrambler and put it to the saisir
% structure
load(NameSaisir);
ZSaisir=[];
if exist('SamplesName','var')
ZSaisir.i=num2str(SamplesName);
[N M]=size(DataMatrix);
%for i=1:M
%  Test(i)=str2num(VariableName(i,:));
%end
Test=VariableName;
Test(Test==0)=' ';

ZSaisir.v=Test;
ZSaisir.d=DataMatrix;

else
    ZSaisir.i=num2str(ObjLabels);
[N M]=size(Matrix);
%for i=1:M
%  Test(i)=str2num(VariableName(i,:));
%end
Test=VarLabels;
Test(Test==0)=' ';

ZSaisir.v=Test;
ZSaisir.d=Matrix;
end

