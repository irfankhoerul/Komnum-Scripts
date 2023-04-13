function y = predict(inputs)
    global hidden_weights hidden_bias output_weights output_bias HIDDEN INPUTS OUTPUTS;
   
   hiddens = zeros(1, HIDDEN);
    for i = 1:HIDDEN
        hidden = 0;
        for j = 1:INPUTS
            hidden = hidden + hidden_weights(i,j) * inputs(j);
        end
        hidden = tanh(hidden + hidden_bias(i));
        hiddens(i) = hidden;
    end
    
    outputs = zeros(1, OUTPUTS);
    for i = 1:OUTPUTS
        output = 0;
        for j = 1:HIDDEN
            output = output + output_weights(i,j) * hiddens(j);
        end
        output = sigmoid(output + output_bias(i));
        outputs(i) = output;
    end
    
    y = outputs(1);
end