function [ Y ] = labelSong( model,F,L )

n = size(F,2);
m = size(F,1);
Y = zeros(n,1);

for t=1:n
    feature = [];
    for i=t-memory:t+foresight
        if i < 1 || i > n
            feature = [feature; zeros(m^2,1)];
        else
            feature = [feature; kron(F(:,i),F(:,i))];
        end
    end
    [~,label] = max(sum(bsxfun(@times,reshape(model.w,numFeatures,25),feature),1));    
    Y(t) = label-1;
end

if nargin == 3
   
    accuracy = sum(abs(Y == L)) / numel(Y)
    
end

end

