function [ Y ] = labelSong( model,F,L )
	 
n = size(F,2);
m = size(F,1);

past = zeros(25,2);
scores = zeros(25,n);
labelmap = zeros(25,n);

feature = makeFeature(0,0,F(:,1));
scores(:,1) = log(sum(bsxfun(@times,reshape(model.w,numFeatures,25),feature),1));

for t=2:n
    scoreupdate = zeros(25,25);
    for f=1:25
    	feature = makeFeature(past(i,1),past(i,2),F(:,t));
	scoreupdate(f,:) = sum(bsxfun(@times,reshape(model.w,numFeatures,25),feature),1);
    end

    

end

if nargin == 3
   
    accuracy = sum(abs(Y == L)) / numel(Y)
    
end

end

