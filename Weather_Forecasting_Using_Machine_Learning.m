% Load the historical weather data (temperature, for example)
data = load('weather_data.mat');
temperature = data.temperature;

% Split data into training and testing sets
train_data = temperature(1:end-30);
test_data = temperature(end-29:end);

% Fit ARIMA model
model = arima(1,1,1);
fit_model = estimate(model, train_data);

% Forecast next 30 days
forecasted_temp = forecast(fit_model, 30, 'Y0', train_data);

% Plot actual vs forecasted temperatures
plot([train_data; test_data], '-b');
hold on;
plot([length(train_data)+1:length(temperature)], forecasted_temp, '-r');
legend('Actual', 'Forecasted');
title('Weather Forecasting Using ARIMA');
