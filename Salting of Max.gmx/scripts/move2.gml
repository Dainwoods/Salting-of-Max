///move2(hspd, vspd)
var hspd = argument[0];
var vspd = argument[1];

//Check for horizontal collisions
if(grid_place_meeting2(x + hspd, y)) {
    while(!grid_place_meeting2(x + sign(hspd), y)) {
        x += sign(hspd);
    }
    hspd = 0;
}
//Move horizontally
x += hspd;
//Verical collisions    
if(grid_place_meeting2(x, y + vspd)) {
    while(!grid_place_meeting2(x, y + sign(vspd))) {
        y += sign(vspd);
    }
    vspd = 0;
}
//Move vertically
y += vspd;
