function [robot,homeConfig] = createRigidBodyTree

% Import the robot description from the URDF file
try
    robot = importrobot('open_manipulator.urdf');
    
    % Add gravity
    gravityVec = [0 0 -9.80665];
    robot.Gravity = gravityVec;
        
    % Add another massless coordinate frame for the end effector
    eeOffset = 0.12;
    eeBody = robotics.RigidBody('end_effector');
    eeBody.Mass = 0;
    eeBody.Inertia = [0 0 0 0 0 0];
    setFixedTransform(eeBody.Joint,trvec2tform([eeOffset 0 0]));
    addBody(robot,eeBody,'link5');
catch
    warning('Error importing URDF file.');
end

% Return its home configuration
homeConfig = robot.homeConfiguration;

end

