function precision = evaluate_model(prediction, data_train)
  a = (prediction == data_train);
  precision = 100*sum(a)/length(a);
