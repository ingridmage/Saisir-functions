function XX=mat2saisir(X,ObjLabels,VarLabels)
% XX=mat2saisir(X,ObjLabels,VarLabels)
% 
% OUTPUT
% XX  Saisir structure
% 
% INPUT
% X           Data matrix
% ObjLabels   optional. char array.
% VarLables   optional. char array.

XX.d=X;

if exist('ObjLabels','var')
    XX.i=ObjLabels;
else
    XX.i=num2str((1:size(X,1))');
end

if exist('VarLabels','var')
    XX.v=VarLabels;
else
    XX.v=num2str((1:size(X,2))');
end

