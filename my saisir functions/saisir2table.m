function T = saisir2table(X)


T=array2table(X.d);
varnames = cellstr(X.v);
varnames = strrep(varnames,'*','x');
varnames = strrep(varnames,'/','div');
T.Properties.VariableNames = varnames;
T.Properties.RowNames = cellstr(X.i);