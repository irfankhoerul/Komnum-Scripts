function learn(inputs, targets, alpha)
   global hidden_weights hidden_bias output_weights output_bias HIDDEN INPUTS OUTPUTS;
    hiddens = zeros(1, HIDDEN);
    for i = 1:HIDDEN
        hidden = 0;
        for j = 1:INPUTS
            hidden = hidden + hidden_weights(i,j) * inputs(j);
        end
        hiddens(i) = sigmoid(hidden + hidden_bias(i));
    end
    
    outputs = zeros(1, OUTPUTS);
    for i = 1:OUTPUTS
        output = 0;
        for j = 1:HIDDEN
            output = output + output_weights(i,j) * hiddens(j);
        end
        outputs(i) = sigmoid(output + output_bias(i));
    end
    
    errors = targets - outputs;
    
    derrors = errors .* sigmoid_prime(outputs);
    
    ds = zeros(1, HIDDEN);
    for i = 1:OUTPUTS
        for j = 1:HIDDEN
            ds(j) = ds(j) + derrors(i) * output_weights(i,j) * sigmoid_prime(hiddens(j));
        end
    end
    
    for i = 1:OUTPUTS
        for j = 1:HIDDEN
            output_weights(i,j) = output_weights(i,j) + alpha * hiddens(j) * derrors(i);
        end
        output_bias(i) = output_bias(i) + alpha * derrors(i);
    end
    
    for i = 1:HIDDEN
        for j = 1:INPUTS
            hidden_weights(i,j) = hidden_weights(i,j) + alpha * inputs(j) * ds(i);
        end
        hidden_bias(i) = hidden_bias(i) + alpha * ds(i);
    end
end