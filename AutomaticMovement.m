global key
InitKeyboard();

while true
    pause(.1);
    bumps = brick.TouchPressed(1);
    if (~bumps)
        brick.MoveMotor('D', 1000);
        brick.MoveMotor('A', 1000);
    else
        pause(.1);
        brick.MoveMotor('D', -1000);
        brick.MoveMotor('A', -1000);
        pause(.5);
        brick.StopMotor('A');
        brick.MoveMotor('D', 1000);


    end




    switch key
        case 'uparrow'
            brick.MoveMotor('D', -1000);
            brick.MoveMotor('A', -1000);
        case 'leftarrow'
             brick.MoveMotor('D', -1000);
            brick.StopMotor('A'); 
        case 'rightarrow'
            brick.MoveMotor('A', -1000);
            brick.StopMotor('D');

        case 'downarrow'
            brick.MoveMotor('D', 1000);
            brick.MoveMotor('A', 1000);
            
        case  0
            brick.StopMotor('D');
            brick.StopMotor('A'); 
        case 'q'

            break;
    end
end
CloseKeyboard();
    