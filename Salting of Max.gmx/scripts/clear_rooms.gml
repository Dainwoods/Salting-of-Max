///clear_rooms()
var changed = true;
while(changed) {
    changed = false;
    for(var xx = 0; xx < ROOMS; xx++) {
        for(var yy = xx; yy < ROOMS; yy++) {
            var xDistance = global.array[yy, 0] - global.array[xx, 0];
            var yDistance = global.array[yy, 1] - global.array[xx, 1];
            if(abs(xDistance) < CONNECT_SIZE * (global.array[xx, 2] div 2) && abs(yDistance) < CONNECT_SIZE * (global.array[xx, 3] div 2)) {
                if(global.array[xx, 4] != global.array[yy, 4]) {
                    global.array[xx, 4] = true;
                    global.array[yy, 4] = true;
                    changed = true;
                }
            }
        }
    }
}
var connectedRooms = 0;
for(var i = 0; i < ROOMS; i++) {
    if(global.array[i, 4] == false) {
        for(var xx = global.array[i, 0] - (global.array[i, 2] div 2) - 2; xx < global.array[i, 0] + (global.array[i, 2] div 2) + 2; xx++) {
            for(var yy = global.array[i, 1] - (global.array[i, 3] div 2) - 2; yy < global.array[i, 1] + (global.array[i, 3] div 2) + 2; yy++) {
                obj_levelGenTest.grid[# xx, yy] = VOID;
            }
        }
    }
    else {
        connectedRooms++;
    }
}
if(connectedRooms < 5) {
    room_restart();
}
