global key
InitKeyboard();

while true
    pause(.1);
    distance = brick.UltrasonicDist(2);
    if(distance > 20)
        brick.MoveMotor('A', 1000);
        brick.StopMotor('D');
        pause(.4);
        % move right

    
    bumps = brick.TouchPressed(1);
    if (bumps == 0)
        brick.MoveMotor('D', 1000);
        brick.MoveMotor('A', 1000);
    else
        pause(.1);
        brick.MoveMotor('D', -1000);
        brick.MoveMotor('A', -1000);
        pause(.4);
        brick.StopMotor('A');
        brick.MoveMotor('D', 1000);


    end




    switch key
        case  0
            brick.StopMotor('D');
            brick.StopMotor('A'); 
        case 'q'

            break;
    end
end
CloseKeyboard();
    
