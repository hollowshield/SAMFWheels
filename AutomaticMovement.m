global key
InitKeyboard();
hasRight = 0;
speed = 50;
brick.SetColorMode(3, 4);
minGreen = 80;
minRed = 100;
minBlue = 100;


while true

   distance = brick.UltrasonicDist(2);
   color_rgb = brick.ColorRGB(3);
   colors(color_rgb, brick, minRed, minGreen, minBlue);

   % move right  
   if (distance >= 60 && hasRight==0)
                
            
        rightTurn(brick,speed);
        
        forward(brick,speed,speed);
        pause(2.1);
        hasRight = 1;
            
           
   end
   

    pressed = brick.TouchPressed(1);
    
    
    % drift 
        if (distance >15 && distance < 50)
            colors(color_rgb, brick, minRed, minGreen, minBlue);
            adjustRight(speed, 0.2, brick);
            adjustLeft(speed, .2, brick);
            
            disp("right");
            
        end
        if (distance <= 15)
            colors(color_rgb, brick, minRed, minGreen, minBlue);
            adjustLeft(speed, .2, brick);
            adjustRight(speed, 0.2, brick);
            
            disp("left");
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
function stopAndThink(time, brick)
    brick.StopAllMotors();
    distance = brick.UltrasonicDist(2);
    pause(time);

end


function adjustLeft(speed, time, brick)
    stopAndThink(.5, brick);

    forward(brick,-speed+1,-speed-1);

    brick.MoveMotor('A', -speed);
    brick.MoveMotor('D', speed);
    pause(time);

    forward(brick, speed, speed);
    pause(1);

    disp("left");
        
end

function adjustRight(speed, time, brick)
    stopAndThink(.5, brick);

    forward(brick,-speed+1,-speed-1);

    brick.MoveMotor('A', speed);
    brick.MoveMotor('D', -speed);
    pause(time);
    
    forward(brick, speed, speed);
    pause(1);
    disp("right");
        
end

function colors(color_rgb, brick, minRed, minGreen, minBlue)
    if(color_rgb(1,1) >= minRed)
        stopAndThink(1, brick);
        disp("red");
    end
    if(color_rgb(1,2) >= minGreen && color_rgb(1,3) < minBlue && color_rgb(1,1) < minRed)
        brick.StopAllMotors();
        for i=1:3
            brick.beep();
            pause(.2);
        end
        pause(1);
        disp("green");
        keyboardMovement;
        
    end
    
    if(color_rgb(1,3) >= minBlue)
        
        brick.StopAllMotors();
        
        for i=1:2
            brick.beep();
            pause(0.2);
        end
        pause(1);
        disp("blue");
        keyboardMovement;
    end
    
end



CloseKeyboard();
    