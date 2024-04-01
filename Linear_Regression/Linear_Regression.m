clear;

% Initialize X and Y
X = 11:40; % generate X
rng(1); % For reproducibility
Y = randi([20, 180], 1, 30);
Y = sort(Y); % Consider whether sorting Y is necessary for your purposes

% Scatter plot
figure(1);
scatter(X, Y);
xlabel("Temperature of the Day (in Degree Celsius)");
ylabel("Number of Ice-Creams Sold");
title("Ice Cream Sales vs. Temperature");
legend("Data Points");

% Calculating coefficients using the Normal Equations
X_mean = mean(X);
Y_mean = mean(Y);
XY_mean = mean(X.*Y);
X2_mean = mean(X.^2);

% Constructing matrices for the normal equation
L = [X2_mean, X_mean; X_mean, 1];
R = [XY_mean; Y_mean];

% Solving for the coefficients
sol = L \ R; % More stable and efficient than using inv(L)
m = sol(1);
b = sol(2);

% Regression line
x_line = 10:1:40;
y_line = m * x_line + b;

% Plotting the regression line
figure(2);
scatter(X, Y);
hold on;
plot(x_line, y_line, 'r', 'LineWidth', 2);
xlabel("Temperature of the Day (in Degree Celsius)");
ylabel("Number of Ice-Creams Sold");
legend("Data Points", "Linear Regression");
title("Linear Regression: Ice Cream Sales vs. Temperature");
hold off;
