% kode program utama
VARIANCE_W = 0.5;

global HIDDEN INPUTS OUTPUTS hidden_weights hidden_bias output_weights output_bias;

INPUTS = 2;
HIDDEN = 3;
OUTPUTS = 1;

hidden_weights = rand(HIDDEN, INPUTS) * (2 * VARIANCE_W) - VARIANCE_W;

hidden_bias = zeros(1, HIDDEN);

output_weights = rand(OUTPUTS, HIDDEN) * (2 * VARIANCE_W) - VARIANCE_W;

output_bias = zeros(1, OUTPUTS);

inputs = [0,0; 0,1;1,0;1,1];

outputs = [0;1;1;0];
    
for i=1:10000
    indexes = randperm(4);
    for j=1:length(indexes)
       learn(inputs(indexes(j), :),outputs(indexes(j)),0.2)
     end
    
    if mod(i,1000)==0
        cost = 0;
        for j=1:4
            o = predict(inputs(j,:));
            cost = cost + (outputs(j,:) - o) ^ 2;
        end
        cost = cost / 4;
        disp([num2str(i), ' mean squared error: ', num2str(cost)]);
    end
end

for i=1:4
   result = predict(inputs(i,:));
   if round(result) == outputs(i,:);
       disp(['for input ', num2str(inputs(i,:)), ' expected ', num2str(outputs(i,:)), ' predicted ', num2str(result,4), ' which is correct']);
    else
       disp(['for input ', num2str(inputs(i,:)), ' expected ', num2str(outputs(i,:)), ' predicted ', num2str(result,4), ' which is incorrect',]);
    end
end

