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
        %forward(brick,speed,speed-3);
        adjustRight(speed, 0.2, brick);
        adjustLeft(speed, .2, brick);

        disp("right");

    end
    if (distance <= 15)
        %forward(brick,speed-1,speed+1);
        adjustLeft(speed, .2, brick);
        adjustRight(speed, 0.2, brick);

        disp("left");
    end
    % if (distance >= 30)
    %     forward(brick,-speed,-speed);
    %     pause(.5)
    %     forward(brick,speed,speed-14);
    %     disp("right strong");
    % end
    % if ( distance <= 10)
    %     forward(brick,-speed,-speed);
    %     stopAndThink(2)
    %     forward(brick,speed-5,speed);
    %     pause(3)
    %     disp("left strong");
    %
    % end
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

    if key == 's'
        brick.MoveMotor('C', 30)
        pause(1);

    if key == 'w'
        brick.MoveMotor('C', -10)
        pause(1);
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
    stopAndThink(1, brick);

    forward(brick,-speed+1,-speed-1);

    brick.MoveMotor('A', -speed);
    brick.MoveMotor('D', speed);
    pause(time);

    forward(brick, speed, speed);
    pause(1);

    disp("left");

end

function adjustRight(speed, time, brick)
    stopAndThink(1, brick);

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
    end
    if(color_rgb(1,2) >= minGreen && color_rgb(1,3) < minBlue)
        brick.StopAllMotors();
        for i=1:3
            brick.beep();
            pause(.2);
        end
        pause(1);

    end
    if(color_rgb(1,3) >= minBlue)

        brick.StopAllMotors();

        for i=1:2
            brick.beep();
            pause(0.2);
        end
        pause(1);
    end

end



CloseKeyboard();
