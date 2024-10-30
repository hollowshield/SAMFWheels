global key
InitKeyboard();
hasRight = 0;
speed = 50;




while true

   distance = brick.UltrasonicDist(2);
    
   % move right  
   if (distance >= 50 && hasRight==0)
                
            
        rightTurn(brick,speed);
        
        forward(brick,speed,speed);
        pause(2);
        hasRight = 1;
            
           
   end
   

    pressed = brick.TouchPressed(1);
    
    
      
    if (distance >=20 && distance < 50)
        forward(brick,speed+4,speed-4);
        disp("right");
        
    end
    if (distance <=15)
        forward(brick,speed-1,speed);
        disp("left");
        
    end
    
    forward(brick,speed,speed);
    
    hasRight = 0;


    if (pressed == 1)
        leftTurn(brick,speed);
        disp(pressed);
    end

    


    if key == 'q'
            brick.StopAllMotors();
            disp(pressed);
            disp(distance);

            break;
        
            
    end
end


function forward( brick,speed1,speed2)
         
    brick.MoveMotor('A', speed1+3);
    brick.MoveMotor('D', speed2);
    
                
        
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
function rightTurn(brick,speed)
        brick.MoveMotor('A', speed-10);
        brick.MoveMotor('D', -speed+10);
        pause(1.05);
        


end



CloseKeyboard();
    