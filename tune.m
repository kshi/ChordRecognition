C = exp([-0.5:0.5:5]);
acc = zeros(1,length(C));
for i=1:length(C)
    acc(i) = crossValidate(data,labels,C(i));
    disp([num2str(acc(i)) '% accuracy for c=' num2str(C(i))]);
end