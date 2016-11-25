///connect_rooms2()
for(var xx = 0; xx < ROOMS; xx++) {
    for(var yy = xx; yy < ROOMS; yy++) {
        var xDistance = global.array[yy, 0] - global.array[xx, 0];
        var yDistance = global.array[yy, 1] - global.array[xx, 1];
        var connectedRooms = 0;
        if(abs(xDistance) < CONNECT_SIZE * (global.array[xx, 2] div 2) && abs(yDistance) < CONNECT_SIZE * (global.array[xx, 3] div 2) && global.array[xx, 4] && global.array[yy, 4]) {
            connectedRooms++;
            var wallNum = 0;
            if(abs(xDistance) > abs(yDistance)) {
                var xMove;
                for(xMove = 0; xMove < abs(xDistance); xMove++) {
                    if(wallNum == 2) {
                        break;
                    }
                    if(obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), global.array[xx, 1]] == WALL) {
                        obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), global.array[xx, 1]] = DOOR;
                        wallNum++;
                    }
                    if(obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), global.array[xx, 1]] != CENTER_ROOM 
                            && obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), global.array[xx, 1]] != DOOR) {
                        obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), global.array[xx, 1]] = FLOOR;
                    }
                }
                var yMove;
                for(yMove = 0; yMove < abs(yDistance); yMove++) {
                    if(wallNum == 2) {
                        break;
                    }
                    if(obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), (global.array[xx, 1] + (yMove * sign(yDistance)))] == WALL) {
                        obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), (global.array[xx, 1] + (yMove * sign(yDistance)))] = DOOR;
                        wallNum++;
                    }
                    if(obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), (global.array[xx, 1] + (yMove * sign(yDistance)))] != CENTER_ROOM 
                            && obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), (global.array[xx, 1] + (yMove * sign(yDistance)))] != DOOR) {
                        obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), (global.array[xx, 1] + (yMove * sign(yDistance)))] = FLOOR;
                    }
                }
            }
            else {
                var yMove;
                for(yMove = 0; yMove < abs(yDistance); yMove++) {
                    if(wallNum == 2) {
                        break;
                    }
                    if(obj_levelGenTest.grid[# global.array[xx, 0], (global.array[xx, 1] + (yMove * sign(yDistance)))] == WALL) {
                        obj_levelGenTest.grid[# global.array[xx, 0], (global.array[xx, 1] + (yMove * sign(yDistance)))] = DOOR;
                        wallNum++;
                    }
                    if(obj_levelGenTest.grid[# global.array[xx, 0], (global.array[xx, 1] + (yMove * sign(yDistance)))] != CENTER_ROOM 
                            && obj_levelGenTest.grid[# global.array[xx, 0], (global.array[xx, 1] + (yMove * sign(yDistance)))] != DOOR) {
                        obj_levelGenTest.grid[# global.array[xx, 0], (global.array[xx, 1] + (yMove * sign(yDistance)))] = FLOOR;
                    }
                }
                var xMove;
                for(xMove = 0; xMove < abs(xDistance); xMove++) {
                    if(wallNum == 2) {
                        break;
                    }
                    if(obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), (global.array[xx, 1] + (yMove * sign(yDistance)))] == WALL) {
                        obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), (global.array[xx, 1] + (yMove * sign(yDistance)))] = DOOR;
                        wallNum++;
                    }
                    if(obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), (global.array[xx, 1] + (yMove * sign(yDistance)))] != CENTER_ROOM 
                            && obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), (global.array[xx, 1] + (yMove * sign(yDistance)))] != DOOR) {
                        obj_levelGenTest.grid[# (global.array[xx, 0] + (xMove * sign(xDistance))), (global.array[xx, 1] + (yMove * sign(yDistance)))] = FLOOR;
                    }
                }
            }
        }
    }
}                 
