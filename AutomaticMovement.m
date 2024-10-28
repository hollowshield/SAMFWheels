global key
InitKeyboard();
hasRight = 0;
speed = 50;




while true

   distance = brick.UltrasonicDist(2);
    
    
   if (distance > 60 && hasRight==0)
                
            
            brick.MoveMotor('A', speed-10);
            brick.MoveMotor('D', -speed+10);
            pause(.7);
            hasRight = 1;
           
            
            % move right 
   end
   if hasRight == 1
       brick.MoveMotor('A', speed+3);
       brick.MoveMotor('D', speed);
       pause(2);
   end
    bumps = brick.TouchPressed(4);
    if (bumps == 0)
        distance = brick.UltrasonicDist(2);
        if (distance <  15)
            brick.MoveMotor('A', speed);
            brick.MoveMotor('D', speed+2);
            distance = brick.UltrasonicDist(2);
            disp('Left');
            % drift left
        end
        if (distance < 30 && distance > 20)
                brick.MoveMotor('A', speed+7);
                brick.MoveMotor('D', speed);
                disp('Right');
                %drift right
                
        else 
                brick.MoveMotor('A', speed+3);
                brick.MoveMotor('D', speed);
                disp('Center');
                % centerish
        end

   



        
        hasRight = 0;

    

    else
        % move left
        pause(.1)
        brick.MoveMotor('A', -speed);
        brick.MoveMotor('D', -speed);
        pause(.8)
            
        brick.MoveMotor('A', -speed);
        brick.MoveMotor('D', speed);
        pause(.7);
     

    end



    switch key
        case 'q'
            brick.StopAllMotors();
            distance = brick.UltrasonicDist(2);

            break;
        
            
    end
end




CloseKeyboard();
    