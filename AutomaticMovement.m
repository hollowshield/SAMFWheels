while true
    pause(0.1)
    distance = brick.UltrasonicDist(2);
    if(distance > 20)
        brick.MoveMotor('A', -1000);
        brick.StopMotor('D');
        % move right
    else
        brick.MoveMotor('D', -1000);
        brick.StopMotor('A');
        % move left
    end
end