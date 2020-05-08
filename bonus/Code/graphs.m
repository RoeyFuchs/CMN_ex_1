%%%%%%%%%%%%%%%%%%%%%%%
%% learning rate graph
%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; clc
% Settings & Parameters
[settings, params] = load_settings_params();
% Data
[data_train, data_test] = load_data(settings);

%% learning rate graph
alpha = [0.001 0.01 0.05 0.1 1 5 50];
params.lambda = 0;

pred_train = zeros(2, length(alpha));
pred = zeros(2, length(alpha));
for i = alpha
  pred(1, find(alpha==i)) = i;
  pred_train(1, find(alpha==i)) = i;
  params.alpha = i;
  model  = train_model(data_train, params);
  pred_train(2, find(alpha==i)) = evaluate_model(predict_y(data_train.X, model.theta), data_train.Y);

  prediction_test = predict_y(data_test.X, model.theta);
  pred(2, find(alpha==i)) = evaluate_model(prediction_test, data_test.Y);
end

close all;
f = plot(pred(1,:), pred(2, :), '.', 'MarkerSize', 20);
hold on;
g = plot(pred_train(1,:), pred_train(2, :), '.', 'MarkerSize', 20);
legend('test set', 'training set')
ylim([80,100]);
xlabel('\alpha (Learning rate)');
ylabel('% Precision');
title('Precision as function of learning rate value');
saveas(f,'graphs/learning rate.jpg')


%%%%%%%%%%%%%%%%%%%%%%%
%% epochs graph
%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; clc
% Settings & Parameters
[settings, params] = load_settings_params();
% Data
[data_train, data_test] = load_data(settings);

epochs = [50 100 250 350 500 1000 1500 2000];
params.alpha = 0.1;
params.lambda = 0;

pred = zeros(2, length(epochs));
pred_train = zeros(2, length(epochs));

for i = epochs
  pred(1, find(epochs==i)) = i;
  pred_train(1, find(epochs==i)) = i;
  params.max_epoch = i;
  model  = train_model(data_train, params);
  prediction_test = predict_y(data_test.X, model.theta);
  pred(2, find(epochs==i)) = evaluate_model(prediction_test, data_test.Y);
  pred_train(2, find(epochs==i)) = evaluate_model(predict_y(data_train.X, model.theta), data_train.Y);
end


close all;
f = plot(pred(1,:), pred(2, :), '.', 'MarkerSize', 20);
hold on;
g = plot(pred_train(1,:), pred_train(2, :), '.', 'MarkerSize', 20);
legend('test set', 'training set')
ylim([0,100]);
xlabel('epochs');
ylabel('% Precision');
title('Precision as function of epochs');
saveas(f,'graphs/epochs.jpg')


%%%%%%%%%%%%%%%%%%%%%%%
%% regularization graph
%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; clc
% Settings & Parameters
[settings, params] = load_settings_params();
% Data
[data_train, data_test] = load_data(settings);

lambda = [0.001 0.05 0.1 1 2.5 5];

pred = zeros(2, length(lambda));
pred_train = zeros(2, length(lambda));
for i = lambda
  pred(1, find(lambda==i)) = i;
  pred_train(1, find(lambda==i)) = i;
  params.lambda = i;
  model  = train_model(data_train, params);
  prediction_test = predict_y(data_test.X, model.theta);
  pred(2, find(lambda==i)) = evaluate_model(prediction_test, data_test.Y);
  pred_train(2, find(lambda==i)) = evaluate_model(predict_y(data_train.X, model.theta), data_train.Y);
end


close all;
f = plot(pred(1,:), pred(2, :), '.', 'MarkerSize', 20);
hold on;
g = plot(pred_train(1,:), pred_train(2, :), '.', 'MarkerSize', 20);
legend('test set', 'training set')
ylim([0,100]);
xlabel('\lambda (regularization constant)');
ylabel('% Precision');
title('Precision as function of regularization constant value');
saveas(f,'graphs/regularization.jpg')
