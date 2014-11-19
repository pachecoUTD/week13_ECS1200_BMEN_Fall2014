%% Code for picking and placing….

%% Connect to Arduino
% Before running this code, connect to the Arduino using the command
% a = arduino('COM3');
% Note: your COM port number may be different

% start timer
tic
 
%% ADD COMMENT HERE
initialize_motor5

%% ADD COMMENT HERE

% forward is opening <-- CHANGE THIS COMMENT TO MATCH WHAT YOUR ROBOT DOES
Gripper_ID = 1; % <-- CHANGE THIS ID TO MATCH YOUR SETUP

% forward is going forward <-- CHANGE THIS COMMENT TO MATCH WHAT YOUR ROBOT DOES
BaseMotion_ID = 2; % <-- CHANGE THIS ID TO MATCH YOUR SETUP

% forward is tipping down <-- CHANGE THIS COMMENT TO MATCH WHAT YOUR ROBOT DOES
ElbowMotion_ID = 3; % <-- CHANGE THIS ID TO MATCH YOUR SETUP

% forward it tipping up <-- CHANGE THIS COMMENT TO MATCH WHAT YOUR ROBOT DOES
WristMotion_ID = 4; % <-- CHANGE THIS ID TO MATCH YOUR SETUP

% forward is moving left looking from behind the robot arm <-- CHANGE THIS COMMENT TO MATCH WHAT YOUR ROBOT DOES
BaseRotation_ID = 5; % <-- CHANGE THIS ID TO MATCH YOUR SETUP


%% ADD COMMENT HERE

motorNames{Gripper_ID} = 'Gripper';
motorNames{BaseMotion_ID} = 'Base Motion';
motorNames{ElbowMotion_ID} = 'Elbow Motion';
motorNames{WristMotion_ID} = 'Wrist Motion';
motorNames{BaseRotation_ID} = 'Base Rotation';


%% ADD COMMENT HERE

potRange(Gripper_ID, :) = [681 980]; % <-- CHANGE THESE VALUES
potRange(BaseMotion_ID, :) = [320 386]; % <-- CHANGE THESE VALUES
potRange(ElbowMotion_ID, :) = [930 1023]; % <-- CHANGE THESE VALUES
potRange(WristMotion_ID, :) = [532 670];  % <-- CHANGE THESE VALUES
potRange(BaseRotation_ID, :) = [400 650]; % <-- CHANGE THESE VALUES
 

%% start by moving all motors to center and high up position
fprintf('Moving all motors to starting position\n');


%% move BaseMotion motor to up position

% ADD COMMENT HERE
moveTime = 0.15; 

% ADD COMMENT HERE
pauseTime = 0.15; 

% ADD COMMENT HERE
LocTol = 10;

% ADD COMMENT HERE
motorID = BaseMotion_ID; 

% ADD COMMENT HERE
potDesiredLocation = 330; % <-- CHANGE THIS VALUE AND ALL OTHER potDesiredLocation VALUES TO MATCH YOUR SETUP

% ADD COMMENT HERE
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);

% ADD COMMENT HERE
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);

% ADD COMMENT HERE
fprintf('reached position %g\n', finalPotLocation);


%% move ElbowMotion motor to up position

moveTime = 0.15; pauseTime = 0.15; LocTol = 10;
% issue move2Location command for motorID
motorID = ElbowMotion_ID; potDesiredLocation = 940;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);


%% move WristMotion motor to up position

moveTime = 0.15; pauseTime = 0.15; LocTol = 10;
% issue move2Location command for motorID
motorID = WristMotion_ID; potDesiredLocation = 650;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);


%% move BaseRotation motor to center

moveTime = 0.15; pauseTime = 0.15; LocTol = 10;
% issue move2Location command for motorID
motorID = BaseRotation_ID; potDesiredLocation = 520;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);


%% open gripper
moveTime = 0.05; pauseTime = 0.15; LocTol = 5;
motorID = Gripper_ID; potDesiredLocation = 950;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);


%% Move base rotation motor to left towards pick-up object region
moveTime = 0.1; pauseTime = 0.15; LocTol = 5;
motorID = BaseRotation_ID; potDesiredLocation = 640;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);


%% Move elbow motor to pick-up position
moveTime = 0.15; pauseTime = 0.15; LocTol = 5;
motorID = ElbowMotion_ID; potDesiredLocation = 1000;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);


%% Move wrist to put tip down for pick-up
moveTime = 0.10; pauseTime = 0.15; LocTol = 5;
motorID = WristMotion_ID; potDesiredLocation = 570;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);


%% Move base motion motor to pick-up
moveTime = 0.20; pauseTime = 0.15; LocTol = 5;
motorID = BaseMotion_ID; potDesiredLocation = 340;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);
 
 
%% close grips
moveTime = 0.05; pauseTime = 0.15; LocTol = 5;
motorID = Gripper_ID; potDesiredLocation = 785;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);


%% Move wrist to put tip up
moveTime = 0.10; pauseTime = 0.15; LocTol = 5;
motorID = WristMotion_ID; potDesiredLocation = 650;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);


%% Elbow up
moveTime = 0.15; pauseTime = 0.15; LocTol = 5;
motorID = ElbowMotion_ID; potDesiredLocation = 940;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);
 
 
%% move base motion motor back
moveTime = 0.20; pauseTime = 0.15; LocTol = 5;
motorID = BaseMotion_ID; potDesiredLocation = 320;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);

 
%% Move base rotation motor to right to drop-off position
moveTime = 0.05; pauseTime = 0.15; LocTol = 5;
motorID = BaseRotation_ID; potDesiredLocation = 435;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);
 

%% Elbow down
moveTime = 0.15; pauseTime = 0.15; LocTol = 5;
motorID = ElbowMotion_ID; potDesiredLocation = 1000;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);

 
%% Move wrist to put tip down
moveTime = 0.10; pauseTime = 0.15; LocTol = 5;
motorID = WristMotion_ID; potDesiredLocation = 536;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);

 
%% open gripper
moveTime = 0.05; pauseTime = 0.15; LocTol = 5;
motorID = Gripper_ID; potDesiredLocation = 970;
fprintf('Moving %s motor to %g... ', motorNames{motorID}, potDesiredLocation);
finalPotLocation = move2Location(a, motor5, motorID, ...
    potRange(motorID,:), potDesiredLocation, moveTime, pauseTime, LocTol);
fprintf('reached position %g\n', finalPotLocation);

% stop timer
toc


