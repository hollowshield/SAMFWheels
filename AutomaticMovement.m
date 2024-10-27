global key
InitKeyboard();
hasRight = 0;
speed = 50;
time = (speed/50)-.2;



while true
    pause(.1);
    distance = brick.UltrasonicDist(2);
    
    
   if (distance > 80 && hasRight==0)
            brick.MoveMotor('AD', -speed);

            pause(.8);
       
            brick.MoveMotor('A', speed);
            brick.MoveMotor('D', -speed);
            pause(time);
            hasRight = 1;
            
            % move right 
   end
    
    bumps = brick.TouchPressed(4);
    if (bumps == 0)
        brick.MoveMotor('AD', speed);
        pause(2)
        hasRight = 0;

    

    else
        % move left
        pause(.1);

        brick.MoveMotor('AD', -speed);
        pause(1);

  
            
        brick.MoveMotor('A', -speed);
        brick.MoveMotor('D', speed);
        pause(time);
     

    end



    switch key
        case 'q'
            brick.StopAllMotors();
            break;
        
            
    end
end




CloseKeyboard();
    