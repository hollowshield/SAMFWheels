global key
InitKeyboard();
hasRight = 0;
speed = 50;
brick.SetColorMode(3, 4);
minGreen = 80;
minRed = 100;
minBlue = 100;


while true
    color_rgb = brick.ColorRGB(3);
    if(false)
        stopAndThink(1, brick);
        
    else
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
        
        if (pressed == 1)
            leftTurn(brick,speed);
            disp(pressed);
        end
        brick.MoveMotorAngleRel('A', 30, 90, 'Brake');
        brick.MoveMotorAngleRel('D', 30, 90, 'Brake');
        
        % drift 
            %if (distance >13 && distance < 50)
                %colors(color_rgb, brick, minRed, minGreen, minBlue);
                %%adjustRight(speed, brick);
                %adjustLeft(speed, brick);
                %disp("right" + distance);
                
            %end
            %if (distance <= 13)
                %colors(color_rgb, brick, minRed, minGreen, minBlue);
                %adjustLeft(speed,  brick);
                %adjustRight(speed, brick);
                %disp("left" + distance);
            %end
       
    
        hasRight = 0;
        % drift end
        
    
        
    
    
        if key == 'q'
                brick.StopAllMotors();
                disp(pressed);
                disp(distance);
    
                break;
            
        end     
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


function adjustLeft(speed, brick)
    stopAndThink(.5, brick);

    brick.MoveMotorAngleRel('A', 30, 90, 'Brake');

    %brick.MoveMotor('A', -speed);
    %brick.MoveMotor('D', speed);
    %pause(time);

    forward(brick, speed, speed);
    pause(1);

    
        
end

function adjustRight(speed, brick)
    stopAndThink(.5, brick);

    brick.MoveMotorAngleRel('D', 30, 90, 'Brake');
    brick.WaitForMotor('D');

    %brick.MoveMotor('A', speed);
    %brick.MoveMotor('D', -speed);
    %pause(time);
    
    %forward(brick, speed, speed);
    %pause(1);
   
        
end

function colors(color_rgb, brick, minRed, minGreen, minBlue)
    if(false)
        stopAndThink(1, brick);
        disp("red");
    end
    if(color_rgb(1,2) >= 1000 && color_rgb(1,3) < minBlue && color_rgb(1,1) < minRed)
        brick.StopAllMotors();
        for i=1:3
            brick.beep();
            pause(.2);
        end
        pause(1);
        disp("green");
        keyboardMovement;
        
    end
    
    if(color_rgb(1,3) >= 1000)
        
        brick.StopAllMotors();
        
        for i=1:2
            brick.beep();
            pause(0.2);
        end
        pause(1);
        disp("blue");
        keyboardMovement;
    end
    if(color_rgb(1,2) >= minGreen && color_rgb(1,1) >= 1000)
        
        brick.StopAllMotors();
        
        for i=1:2
            brick.beep();
            pause(0.2);
        end
        pause(1);
        disp("yellow");
        keyboardMovement;
    end
end



CloseKeyboard();
    