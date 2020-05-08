function precision = evaluate_model(prediction, data_train)
  a = (prediction == data_train);
  precision = sum(a)/length(a);
  precision = 100*precision;
