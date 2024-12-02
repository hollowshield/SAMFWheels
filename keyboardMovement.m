global key
InitKeyboard();
speed= 20;
while true
    pause(.1);
    switch key
        case 'uparrow'
            brick.MoveMotor('D',speed);
            brick.MoveMotor('A', speed);
        case 'leftarrow'
             brick.MoveMotor('D', speed);
            brick.StopMotor('A',-speed);
        case 'rightarrow'
            brick.MoveMotor('A', speed);
            brick.MoveMotor('D',-speed);
        case 'downarrow'
            brick.MoveMotor('D', -speed);
            brick.MoveMotor('A', -speed);

        case 'w'
            brick.MoveMotorAngleAbs('C', 20, 50, 'Brake'); 

        case 's'
            brick.MoveMotorAngleAbs('C', 20, -50, 'Brake'); 

        case  0
            brick.StopMotor('D');
            brick.StopMotor('A');
        case 'q'
            AutomaticMovement;
            break;
        case 'p'
            break;
    end
end
