%% Developed by Kusay Tomeh,
%% kusay.tomah@gmail.com  
%% add folders to matlab pathes
addpath('initilization');
addpath('Images');
addpath('Libraries');
addpath('RobotSTLFiles');

%% Design constraints
torqueUpperLimit = 2.0;%N.m
torqueLowerLimit = -2.0 ;%N.m
jointVelocityUpperLimit = 2*pi;%rad per sec
jointVelocityLowerLimit = -2*pi;%rad per sec

%% simscape constants
joint_damping = 0.2;
grip_stiffness = 1.0 ;
grip_damping = 5.0 ;
floor_dimensions = [60 60 0.5] ;%c.m
gripUpperLimit = 2.0 ;%c.m
gripLowerLimit = -2.0 ;%c.m

%% robot tree
[robot,homeConfig] = createRigidBodyTree();

%% set initial position of joints based on simulation case
J1_initial_position= 0;%rad
J2_initial_position= -pi/2;%rad
J3_initial_position= -pi/2;%rad
J4_initial_position = 0;%rad

%% robot model variant selection
RobotModelToSimulate = 1;
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
return

%% Please run the follwing four models individually
%% set joint 1 as troque actuated , All other joints actuation is position q
RobotModelToSimulate = 1;
uiopen('sessions\session3\reduced_model_PT1_J1.slx',1);
return
%% set joint 2 as troque actuated , All other joints actuation is position q
RobotModelToSimulate = 2;
uiopen('sessions\session3\reduced_model_PT1_J2.slx',1);
return
%% set joint 3 as troque actuated , All other joints actuation is position q
RobotModelToSimulate = 3;
uiopen('sessions\session3\reduced_model_PT1_J3.slx',1);
return
%% set joint 4 as troque actuated , All other joints actuation is position q
RobotModelToSimulate = 4;
J2_initial_position= 0;%rad
J3_initial_position= 0;%rad
uiopen('sessions\session3\reduced_model_PT1_J4.slx',1);
return