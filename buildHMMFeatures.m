% call init, then call this script after loading each file
n = size(F,2);
m = size(F,1);
memory = 2; %number of labels before current state; default 1 for MC
foresight = 0; %number of labels after current state

%store previous unique chords
label1 = 0; %0 for no chord
label2 = 0;
for t=1:n    
    hypercube = embedChordPairs(label1,label2);
    HCFeat = kron([hypercube; 1],kron([hypercube; 1],hypercube));
    %HCFeat = hypercube;
    chromaFeat = kron([F(:,t); 1],F(:,t));
    %chromaFeat = F(:,t);
    feature = [HCFeat; chromaFeat];
    if L(t) ~= label2
        label1 = label2;
        label2 = L(t);
    end
    %for i=t-memory:t+foresight
    %    if i < 1 || i > n
    %        feature = [feature; zeros(m^2,1)];
    %    else
    %        feature = [feature; kron(F(:,i),F(:,i))];
    %    end
    %end
    data{length(data)+1} = sparse(reshape(feature,size(feature,1)*size(feature,2),1));
    labels{length(labels)+1} = L(t);
end
save('trainingdata','data')
save('traininglabels','labels')