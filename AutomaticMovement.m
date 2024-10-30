global key
InitKeyboard();
hasRight = 0;
speed = 50;
brick.SetColorMode(3, 4);



while true

   distance = brick.UltrasonicDist(2);
   color_rgb = brick.ColorRGB(3);

   % move right  
   if (distance >= 60 && hasRight==0)
                
            
        rightTurn(brick,speed);
        
        forward(brick,speed,speed);
        pause(2.1);
        hasRight = 1;
            
           
   end
   

    pressed = brick.TouchPressed(1);
    
    
    % drift  
    if (distance >20 && distance < 30)
        forward(brick,speed,speed-3);
        disp("right");
        
    end
    if (distance <=20 && distance > 10)
        forward(brick,speed-1,speed+1);
        disp("left");
        
    end
    if (distance >= 30)
        forward(brick,-speed,-speed);
        pause(.5)
        forward(brick,speed,speed-14);
        disp("right strong");
    end
    if ( distance <= 10)
        forward(brick,-speed,-speed);
        stopAndThink(2)
        forward(brick,speed-5,speed);
        pause(3)
        disp("left strong");
     
    end
    hasRight = 0;
    % drift end
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
function stopAndThink(time)
    brick.StopAllMotors();
    distance = brick.UltrasonicDist(2);
    pause(time);

end


function adjustLeft(distance, speed, time)
    if (distance <=20)
        stopAndThink(2);

        forward(brick,-speed+1,-speed-1);

        brick.MoveMotor('A', -speed);
        brick.MoveMotor('D', speed);
        pause(time);

        disp("left");
        
    end
end


CloseKeyboard();
    