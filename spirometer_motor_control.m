% Arduino analog channel for spirometer signal
spirometerAnalogID = 0;

fprintf('Waiting for spirometer command');

% get the initial spriometer value
spirometer_value = analogRead(a,spirometerAnalogID);

% use a while loop to wait for spirometer value to exceeed threshold
while (spirometer_value < 550)
    % fprintf a '.' tick mark as the loop waits for a large spirometer
    % value
    fprintf('.');

    spirometer_value = analogRead(a,spirometerAnalogID);

    % pause for 0.1 secs so that we only read 10 values per second
    pause(0.1);
end

% print end of line character
fprintf('\n');

% call the script to that does the pick and place
pick_and_place_object




   
