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
    if(color_rgb(1,1) > minRed && color_rgb(1,1) <= 255)
        colors(color_rgb, brick, minRed, minGreen, minBlue)
        
    else
       distance = brick.UltrasonicDist(2);
       color_rgb = brick.ColorRGB(3);
       colors(color_rgb, brick, minRed, minGreen, minBlue);
    
       % move right  
       if (distance >= 60 && hasRight==0)
                    
                
            rightTurn(brick,speed);
            
            forward(brick,speed,speed);
            pause(.5);
            stopAndThink(1,brick);
            forward(brick,speed,speed);
            pause(1.5);
            
            hasRight = 1;
                
               
       end
       
    
        pressed = brick.TouchPressed(1) || brick.TouchPressed(4);
        
        if (pressed == 1)
            leftTurn(brick,speed);
            disp(pressed);
        end
        
        if (distance >=15 && distance <= 20)
            forward(brick, speed,speed)
        end 
        % drift 
            if (distance >20 && distance < 50)
                colors(color_rgb, brick, minRed, minGreen, minBlue);

                adjustRight(speed, brick);

                
                
                
                %adjustLeft(speed, brick);
                %disp("right" + distance);
                
            end
            if (distance <= 15)
                colors(color_rgb, brick, minRed, minGreen, minBlue);

                
                adjustLeft(speed,  brick);
                
               

            end
       
    
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
        pause(.87);
        


end
function stopAndThink(time, brick)
    brick.StopAllMotors();
    distance = brick.UltrasonicDist(2);
    pause(time);

end


function adjustLeft(speed, brick)
    disp("left")
    
    forward(brick, speed, speed+2);
    %pause(time);

    
        
end

function adjustRight(speed, brick)
    disp("right")

     forward(brick, speed+5, speed);

    %brick.MoveMotor('A', speed);
    %brick.MoveMotor('D', -speed);
    %pause(time);
    
   
    %pause(1);
   
        
end

function colors(color_rgb, brick, minRed, minGreen, minBlue)
    if(color_rgb(1,1) > minRed && color_rgb(1,1) <= 255)
        stopAndThink(1, brick);
        disp("red");
        forward(brick, 50,50)
        pause(.5)

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
    
    if(color_rgb(1,3) >= minBlue && color_rgb(1,3) <= 255)
        
        brick.StopAllMotors();
        
        for i=1:2
            brick.beep();
            pause(0.2);
        end
        pause(1);
        disp("blue");
        keyboardMovement;
    end
    if(color_rgb(1,2) >= minGreen && color_rgb(1,1) >= minRed && color_rgb(1,2) <= 255)
        
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
    
