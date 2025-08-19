function X = table2saisir(T,dummify)
% X = table2saisir(T,dummify)
% 
% convert table to saisir structure.
% if dummify ==1, category variables will be converted to dummy variables.
% if not, they will be removed


if nargin==1; dummify =0; end

cellformats = varfun(@class,T,'OutputFormat','cell');
catvar = find((strcmp(cellformats,'categorical')));


if length(catvar>0) & dummify==1
    varnames = T.Properties.VariableNames;
    % replace catvars with numeric
    for i=1:length(catvar)
        catnames = matlab.lang.makeValidName(categories(T.(varnames{catvar(i)})));
        dummy = array2table(dummyvar(T.(varnames{catvar(i)})),'VariableNames',strcat(varnames{catvar(i)},'_',catnames));
        if length(catnames)>2
            
            T=[T dummy];
        elseif length(catnames)==2
            T=[T dummy(:,1)];
            
        end
    end
    %remove original category variables

    T(:,catvar)=[];
   
end




cellformats = varfun(@class,T,'OutputFormat','cell');

numvar = (strcmp(cellformats,'double') | strcmp(cellformats,'logical') | strcmp(cellformats,'int64'));

X.d = table2array(T(:,numvar));
X.v = char(T.Properties.VariableNames(numvar)');

if ~istimetable(T)
if isempty(T.Properties.RowNames)
X.i = num2str((1:size(T,1))');
else
   X.i = char(T.Properties.RowNames'); 
end

else
   X.i = datestr(T.Properties.RowTimes); 
end

if sum(numvar)<size(T,2)
disp('Non-numeric variables removed:')
disp(char(T.Properties.VariableNames(~numvar)'))
end

