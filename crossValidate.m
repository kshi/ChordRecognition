function accuracy = crossValidate(data,labels,c)
    n = length(data);
    f = floor(n/5);
    error = 0;
    for i=1:5 % 5-fold
        
        trainData = data;
        trainLabels = labels;
        trainData((i-1)*f+1:i*f) = [];
        trainLabels((i-1)*f+1:i*f) = [];
        testData = data( (i-1)*f+1:i*f );
        testLabels = labels( (i-1)*f+1:i*f);
        model = trainSVM(trainData,trainLabels,c);
        
        for j=1:length(testData)
            [~,label] = max(sum(bsxfun(@times,reshape(model.w,length(testData{j}),25),testData{j}),1));
            if label-1 ~= testLabels{j}
                error = error + 1;
            end
        end
    end
    error = error / (5*f);
    accuracy = 1 - error;
end