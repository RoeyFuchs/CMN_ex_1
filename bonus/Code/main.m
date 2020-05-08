%% INIT
clear; close all; clc
% Settings & Parameters
[settings, params] = load_settings_params();
% Data
[data_train, data_test] = load_data(settings);

data_train.Y = data_train.Y == 1;
data_test.Y = data_test.Y == 1;

% Train model
model  = train_model(data_train, params);
% Predict
prediction = predict_y(data_train.X, model.theta);
% evaluate
precision = evaluate_model(prediction, data_train.Y);

%% Test set
% Predict
prediction_test = predict_y(data_test.X, model.theta);         % COMPLETE CODE HERE
% evaluate
precision_test = evaluate_model(prediction_test, data_test.Y);
