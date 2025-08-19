function [X,idx]=remove_missing(X,dim,plots)
% [X,idx]=remove_missing(X,dim)
% 
% remove rows or columns with missing values
% X: saisir structure
% dim: 1=rows, 2=columns
% plots: 1=plot number of missing per row/column


if nargin==1
    dim=1;
    plots=0;
elseif nargin==2
    plots=0;
end

if plots==1
    figure; subplot(1,2,1);
    bar(sum(isnan(X.d),1));
    set(gca,'xtick',1:size(X.d,2),'xticklabel',X.v,'XTickLabelRotation',90,'ylim',[1 size(X.d,1)]);
    title('Variables')
    
    subplot(1,2,2);
    bar(sum(isnan(X.d),2));
    set(gca,'xtick',1:size(X.d,1),'xticklabel',X.i,'XTickLabelRotation',90,'ylim',[1 size(X.d,2)]);
    title('Samples')
end

if dim==1;
    idx=find(sum(isnan(X.d),2)>0);
    idx2 = find(sum(isinf(X.d),2)>0);
    nmissing=length(idx);
    ninf = length(idx2);
    nperc=round(((nmissing+ninf)/size(X.d,1)*100*10))/10;
        disp(['Removing ' num2str(nmissing) ' missing and ' num2str(ninf) ' inf values  (' num2str(nperc) '% of rows removed)']);
X=deleterow(X,sort(unique([idx; idx2])));

elseif dim==2;
        idx=find(sum(isnan(X.d),1)>0);
        idx2 = find(sum(isinf(X.d),1)>0);
    nmissing=length(idx);
     ninf = length(idx2);
    nperc=round(((nmissing+ninf)/size(X.d,2)*100*10))/10;
        disp(['Removing ' num2str(nmissing) ' missing and ' num2str(ninf) ' inf values  (' num2str(nperc) '% of columns removed)']);
X=deletecol(X,sort([idx; idx2]));

end


