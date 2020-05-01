function model = train_model(data, params)
%% Initialize
rng(params.seed)

[num_samples, num_features] = size(data.X);
% initialize W to random values

theta =  rand(1,num_features);

%% SGD with hinge-loss
figure(1)
clf; hold on
xlabel('learning epoch'); ylabel('train error');
error = [];
for epoch = 1:params.max_epoch
    fprintf('\nEpoch #%i: ', epoch)
    
    % Arrange samples in random order for each learning epoch
    epoch_order = randperm(num_samples);
    % Initialize the error
    error(epoch) = 0;
    
    % we will use stochastic gradient descent to train our model
    for iter = 1:num_samples
        % Get current sample
        sample_index = epoch_order(iter);
        current_sample =    % COMPLETE CODE HERE
        current_label =     % COMPLETE CODE HERE
        % Update weights
        condition =  % COMPLETE CODE HERE 
        if   % COMPLETE CODE HERE
            error(epoch) =  % COMPLETE CODE HERE
            change_vec= % COMPLETE CODE HERE
            theta = % COMPLETE CODE HERE
        end
    end
    % Plot average error
    if epoch>params.convergence_window
        plot(epoch, mean(error(epoch-params.convergence_window:epoch)), '.', 'MarkerSize', 10)
        drawnow
    end

end
%% Output model
model.theta = theta;
model.training_error = error;
model.num_of_epochs = epoch;
end