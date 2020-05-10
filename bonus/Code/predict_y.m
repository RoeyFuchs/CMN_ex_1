function predicted = predict_y(X, theta)
  THRESHOLD = 0.5;
  predicted = zeros(length(X(:,1)), 1);
  for i = 1:length(predicted)
    value = sigmoid(dot(theta, X(i,:)));
    if value>THRESHOLD
      predicted(i) = 1;
    else
      predicted(i) = 0;
    end
end
