%% Developed by Kusay Tomeh, kusay.tomah@gmail.com
%% with help from matlab contents
%% add folders to matlab pathes
addpath('initilization');
addpath('Images');
addpath('Libraries');
addpath('RobotSTLFiles');

%% simscape constants
joint_damping = 0.2;
grip_stiffness = 1.0 ;
grip_damping = 5.0 ;
floor_dimensions = [60 60 0.5] ;%c.m
gripUpperLimit = 2.0 ;%c.m
gripLowerLimit = -2.0 ;%c.m

%% Design constraints
torqueUpperLimit = 2.0;%N.m
torqueLowerLimit = -2.0 ;%N.m
jointVelocityUpperLimit = 2*pi;%rad per sec
jointVelocityLowerLimit = -2*pi;%rad per sec

%% robot tree
[robot,homeConfig] = createRigidBodyTree();

%% set initial position of joints based on simulation case
J1_initial_position= 0;%rad
J2_initial_position= -pi/2;%rad
J3_initial_position= -pi/2;%rad
J4_initial_position = 0;%rad

%% robot model variant selection
RobotModelToSimulate = 0;
% 0 <==> All joints actuation is position q
% 5 <==> All joints actuation is Torque tau
% 1 <==> joint1 actuation is torque tau , All other joints actuation is position q
% 2 <==> joint2 actuation is torque tau , All other joints actuation is position q
% 3 <==> joint3 actuation is torque tau , All other joints actuation is position q
% 4 <==> joint4 actuation is torque tau , All other joints actuation is position q
Robot_MotionAcuated= Simulink.Variant('RobotModelToSimulate==0');
Robot_J1torqueActuated= Simulink.Variant('RobotModelToSimulate==1');
Robot_J2torqueActuated= Simulink.Variant('RobotModelToSimulate==2');
Robot_J3torqueActuated= Simulink.Variant('RobotModelToSimulate==3');
Robot_J4torqueActuated= Simulink.Variant('RobotModelToSimulate==4');
Robot_TorqueAcuated= Simulink.Variant('RobotModelToSimulate==5');

%%
uiopen('sessions\session1\motion_joints.slx',1);

%%
wayPoints_simple_trajectory = [0.2 -0.2 0.15; 0.2 -0.2 0.02;0.25 0 0.15; 0.2 0.2 0.02];% 4 points
wayPoints_complex_trajectory = [0.2 -0.2 0.15; 0.2 -0.2 0.02; 0.15 0 0.28;0.15 0.05 0.2;...
    0.15 0.09 0.15; 0.1 0.12 0.1; 0.04 0.1 0.2; 0.25 0 0.15; 0.2 0.2 0.02];% 9 points
wayPoints_trajectory = wayPoints_simple_trajectory;

%%
uiopen('sessions\session1\motion_planning.slx',1);
