global key
InitKeyboard();
hasRight = 0;
speed = 50;




while true

   distance = brick.UltrasonicDist(2);
    
   % move right  
   if (distance >= 50 && hasRight==0)
                
            
        rightTurn(brick,speed,distance, hasRight);
        
        forward(brick,speed,speed);
        pause(2);
        hasRight = 1;
            
           
   end
   

    bumps = brick.TouchPressed(4);
    
    if (bumps == 0)  
        distance = brick.UltrasonicDist(2);
        if (distance >=30 && distance < 50)
            forward(distance,brick,speed+2,speed);
        end
        if (distance <=20)
            forward(distance,brick,speed-3,speed);
        end
        if (distance > 20 && distance <30)
            forward(distance,brick,speed,speed);
        end
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


function forward( brick,speed1,speed2)
         
    brick.MoveMotor('A', speed1+3);
    brick.MoveMotor('D', speed2);
    disp('Center');
                
        
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
        pause(1.05);
        


end

CloseKeyboard();
    