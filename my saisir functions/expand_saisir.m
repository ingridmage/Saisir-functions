function Xnew=expand_saisir(Xsmall,Xbig,idx_small,idx_big)
% expand_saisir(Xsmall,Xbig,idx_small,idx_big)
% 
% Multiply rows in Xsmall so that they match Xbig. 
% Use samples name characters idx_small and idx_big to match tables.

Xnew.d=zeros(size(Xbig.d,1),size(Xsmall.d,2));
Xnew.v=Xsmall.v;

for i=1:size(Xsmall.i,1)
   ii=find(strcmp(strcat(Xsmall.i(i,idx_small)),cellstr(Xbig.i(:,idx_big))));
    
   Xnew.d(ii,:)=repmat(Xsmall.d(i,:),length(ii),1);
   Xnew.i(ii,:)=repmat(Xsmall.i(i,:),length(ii),1);
end