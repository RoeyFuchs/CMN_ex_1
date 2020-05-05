function model = train_model(data, params)
%% Initialize
rng(params.seed)

[num_samples, num_features] = size(data.X);
% initialize W to random values

theta =  rand(1,num_features);
best_theta = theta;
%best_error = inf;
best_pres = inf;

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
        current_sample =  data.X(iter, :);
        current_label =  data.Y(iter);
        % Update weights
        condition =  current_label*dot(theta, current_sample); % y_hat * current_label
        if  (condition < 0)
            error(epoch) = error(epoch) -1*condition;
            change_vec = params.alpha*current_label*current_sample;
            theta = theta -2*params.alpha*params.lambda*theta + change_vec;
        end
    end
    error(epoch) = (error(epoch) + params.lambda*sum(theta.^2)) / num_samples;
    pres = evaluate_model(predict_y(data.X, theta), data.Y);
    % find the best theta
    if pres < best_pres
      best_theta = theta;
      best_pres = pres;
    end
    disp(pres)
    % Plot average error
    if epoch>params.convergence_window
        plot(epoch, mean(error(epoch-params.convergence_window:epoch)), '.', 'MarkerSize', 10)
        drawnow
    end

end
%% Output model
model.theta = best_theta;
model.training_error = error;
model.num_of_epochs = epoch;
end
