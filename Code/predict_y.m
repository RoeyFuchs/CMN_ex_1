function predicted = predict_y(X, theta)
  predicted = zeros(length(X(:,1)), 1);
  for i = 1:length(predicted)
    predicted(i) = sign(dot(theta, X(i,:)));
end
