global key
InitKeyboard();
hasRight = 0;
speed = 50;




while true

   distance = brick.UltrasonicDist(2);
    
   % move right  
   if (distance >= 50 && hasRight==0)
                
            
        rightTurn(brick,speed,distance, hasRight);
           
            
           
   end
   if hasRight == 1
       %Checks for right turn once.
       forward(distance,brick,speed);
       pause(2);

   end

    bumps = brick.TouchPressed(4);
    if (bumps == 0)
        
        distance = brick.UltrasonicDist(2);
        forward(distance,brick,speed);
        hasRight = 0;


    

    else
        
        leftTurn(brick,speed);

    end



    switch key
        case 'q'
            brick.StopAllMotors();
            distance = brick.UltrasonicDist(2);

            break;
        
            
    end
end


function forward(distance, brick,speed)
        
        % drift left
        if (distance <  15)
            brick.MoveMotor('A', speed);
            brick.MoveMotor('D', speed+2);
            
            disp('Left');
           
        end
        %drift right
        if (distance < 30 && distance > 20)
                brick.MoveMotor('A', speed+7);
                brick.MoveMotor('D', speed);
                disp('Right');
                
        % centerish       
        else 
                brick.MoveMotor('A', speed+3);
                brick.MoveMotor('D', speed);
                disp('Center');
                
        end
end


function leftTurn(brick,speed)
    % move left
        brick.MoveMotor('A', -speed);
        brick.MoveMotor('D', -speed);
        pause(.8)
            
        brick.MoveMotor('A', -speed);
        brick.MoveMotor('D', speed);
        pause(.7);
end
function rightTurn(brick,speed,distance, hasRight)
        brick.MoveMotor('A', speed-10);
        brick.MoveMotor('D', -speed+10);
        pause(.8);
        hasRight = 1;


end

CloseKeyboard();
    