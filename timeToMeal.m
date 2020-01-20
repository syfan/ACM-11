% TIMETOMEAL
% Calculates how long it takes to get eaten by 3 raptors, 
% given an angle in which to run.
% At 30 degrees, you last 0.4625 seconds.

function tDevour = timeToMeal(a) 
    person_vel = 6;
    v_h = [person_vel * cos(deg2rad(a)); person_vel * sin(deg2rad(a))];
    r1 = [-10, -20 * sqrt(3) / 6];
    r2 = [10, -20 * sqrt(3) / 6];
    r3 = [0, 40 * sqrt(3) / 6];
    
    r1_ode = @(t, r1) 25 * (((t * v_h) - r1) / norm(v_h * t - r1));
    r2_ode = @(t, r2) 25 * (((t * v_h) - r2) / norm(v_h * t - r2));
    r3_ode = @(t, r3) 20 * (((t * v_h) - r3) / norm(v_h * t - r3));
    
    function [val, eats, direction] = movement(t, raptor)
       val = norm(raptor - t * v_h) - 0.1;
       eats = 1;
       direction = 0;
    end

    options_struc = odeset('Events', @movement);
    [~,~,tDevour1] = ode45(r1_ode, [0, 1], r1, options_struc);
    [~,~,tDevour2] = ode45(r2_ode, [0, 1], r2, options_struc);
    [~,~,tDevour3] = ode45(r3_ode, [0, 1], r3, options_struc);
    tDevour = min([tDevour1, tDevour2, tDevour3]);    
end