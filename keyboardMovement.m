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
            
        case  0
            brick.StopMotor('D');
            brick.StopMotor('A'); 
        case 'q'
            AutomaticMovement;
            break;
    end
end

