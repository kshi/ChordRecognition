function model = trainSVM(data,labels,c)
    if nargin < 3
        c = 1;
    end
    param = struct;
    param.patterns = data;
    param.labels = labels;
    param.dimension = length(data{1})*25;
    param.featureFn = @feature;
    param.constraintFn = @constraint;
    param.lossFn = @loss;
    args = ['-c ' int2str(c)];
    model = svm_struct_learn(args,param);
    
end

function F = feature(param,x,y)
    F = zeros(length(x),25);
    F(:,y+1) = x';
    F = sparse(reshape(F,size(F,1)*size(F,2),1));
end

function L = loss(param,y,ybar)
    L = double(y ~= ybar);
end

function yhat = constraint(param,model,x,y)
    scores = zeros(1,25);
    for i=1:25
       scores(i) = dot(param.featureFn(param,x,i-1), model.w); 
    end
    margin = -scores + scores(y+1);
    margin(y+1) = 1;
    [slack,sv] = min( margin );
    if slack < 1
        yhat = sv-1;
    else
        yhat = y;
    end
end