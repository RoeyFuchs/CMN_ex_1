function [settings, params] = load_settings_params()

    %%  SETTINGS
    settings.dataset_file = 'Neurons.txt';
    settings.path2data = fullfile('..', 'data',settings.dataset_file);

    %% MODEL PARAMETERS
    params.seed = 1;
    params.alpha = 0.01;
    params.max_epoch = 500;
    params.convergence_window = 50;
    params.CV_k = 5;
    params.lambda = 0.001;

end
