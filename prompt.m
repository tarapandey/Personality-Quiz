function updatedArray = prompt(array, low, high)
    fprintf('Would you consider yourself to be %s (-10.0) or %s (10.0)\n', low, high);  % 's' reads input as a string
    userInput = input('', 's');
    userNumber = str2double(userInput);

    if (userNumber > -10) && (userNumber < 10)
        updatedArray = [array; {low, high, userNumber}];
    else
        error('Please try again.');
    end

end
 