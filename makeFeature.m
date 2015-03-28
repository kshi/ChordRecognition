function [ F ] = makeFeature(label1, label2, chroma)

    hypercube = embedChordPairs(label1,label2);
    HCFeat = kron([hypercube; 1], kron([hypercube; 1],hypercube));
    chromaFeat = kron([F(:,t); 1], F(:,t));
    F = [HCFeat; chromaFeat];

end
