///generate_room2(x, y, isStart)
//Sets a NO_CENTER zone around the spawn room
var cx = argument[0];
var cy = argument[1];
var isStart = argument[2];
if(isStart) {
    //Sets a NO_CENTER zone around the spawn room
    ds_grid_set_region(obj_levelGenTest.grid, cx - (START_ROOM_WIDTH div 2) - (MAX_ROOM_SIZE div 2) - 1, cy - (START_ROOM_HEIGHT div 2) - (MAX_ROOM_SIZE div 2) - 1, 
                             cx + (START_ROOM_WIDTH div 2) + (MAX_ROOM_SIZE div 2) + 1, cy + (START_ROOM_HEIGHT div 2) + (MAX_ROOM_SIZE div 2) + 1, NO_CENTER);
    //Creates spawn room floor.                         
    ds_grid_set_region(obj_levelGenTest.grid, cx - (START_ROOM_WIDTH div 2), cy - (START_ROOM_HEIGHT div 2), 
                             cx + (START_ROOM_WIDTH div 2), cy + (START_ROOM_HEIGHT div 2), FLOOR);
    global.array[global.roomCount, 0] = cx;
    global.array[global.roomCount, 1] = cy;
    global.array[global.roomCount, 2] = START_ROOM_WIDTH;
    global.array[global.roomCount, 3] = START_ROOM_HEIGHT;
    global.array[global.roomCount, 4] = true;
}
else {
    var width = room_width div CELL_WIDTH;
    var height = room_height div CELL_HEIGHT;
    var roomHeight = irandom_range(MIN_ROOM_SIZE, MAX_ROOM_SIZE);
    var roomWidth = irandom_range(MIN_ROOM_SIZE, MAX_ROOM_SIZE);
    for(var xx = cx - (roomWidth div 2) - (MAX_ROOM_SIZE div 2) - 1; xx < cx + (roomWidth div 2) + (MAX_ROOM_SIZE div 2) + 1; xx++) {
        for(var yy = cy - (roomHeight div 2) - (MAX_ROOM_SIZE div 2) - 1; yy < cy + (roomHeight div 2) + (MAX_ROOM_SIZE div 2) + 1; yy++) {
            if(xx > 0 && xx < width - 1 && yy > 0 &&  yy < height - 1 && grid[# xx, yy] == VOID) {
                grid[# xx, yy] = NO_CENTER;
            }
        }
    }                        
    ds_grid_set_region(obj_levelGenTest.grid, cx - (roomWidth div 2), cy - (roomHeight div 2), 
                             cx + (roomWidth div 2), cy + (roomHeight div 2), FLOOR);
    global.array[global.roomCount, 0] = cx;
    global.array[global.roomCount, 1] = cy;
    global.array[global.roomCount, 2] = roomWidth;
    global.array[global.roomCount, 3] = roomHeight;
    global.array[global.roomCount, 4] = false;
}
//Creates the spawn's center room       
global.roomCount++;         
grid[# cx, cy] = CENTER_ROOM;
