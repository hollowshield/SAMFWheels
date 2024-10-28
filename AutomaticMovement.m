global key
InitKeyboard();
hasRight = 0;
speed = 50;




while true

   distance = brick.UltrasonicDist(2);
    
    
   if (distance > 60 && hasRight==0)

            pause(.5);
            brick.MoveMotor('A', speed-10);
            brick.MoveMotor('D', -speed+10);
            pause(.35/4);
            hasRight = 1;
           
            
            % move right 
   end
    
    bumps = brick.TouchPressed(4);
    if (bumps == 0)
        pause(1)
        distance = brick.UltrasonicDist(2);
        if (distance <  15)
            brick.MoveMotor('A', speed);
            brick.MoveMotor('D', speed+2);
            distance = brick.UltrasonicDist(2);
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
                % centerish
        end

   



        pause(2)
        hasRight = 0;

    

    else
        % move left
        pause(.1)
        brick.MoveMotor('A', -speed);
        brick.MoveMotor('D', -speed);
        pause(.8)
            
        brick.MoveMotor('A', -speed);
        brick.MoveMotor('D', speed);
        pause(.45);
     

    end



    switch key
        case 'q'
            brick.StopAllMotors();
            distance = brick.UltrasonicDist(2);

            break;
        
            
    end
end




CloseKeyboard();
    