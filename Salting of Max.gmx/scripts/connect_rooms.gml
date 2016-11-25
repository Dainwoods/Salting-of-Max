///connect_rooms(x, y)
var cx = argument[0];
var cy = argument[1];
var width = room_width div CELL_WIDTH;
var height = room_height div CELL_HEIGHT;
var roomWidth = 1;
var xx = cx;
while(obj_levelGenTest2.grid[# xx, cy] == FLOOR || obj_levelGenTest2.grid[# xx, cy] == CENTER_ROOM) {
    xx++;
    roomWidth++;
}
roomWidth = roomWidth * 2;
var roomHeight = 1;
var yy = cy;
while(obj_levelGenTest2.grid[# cx, yy] == FLOOR || obj_levelGenTest2.grid[# cx, yy] == CENTER_ROOM) {
    yy++;
    roomHeight++;
}
roomHeight = roomHeight* 2;
var xDistance;
var yDistance;
for(xx1 = max((MAX_ROOM_SIZE div 2), cx - (CONNECT_SIZE * roomWidth)); xx1 < min((width - (MAX_ROOM_SIZE div 2)), (cx + (CONNECT_SIZE * roomWidth))); xx1++) {
    for(yy1 = max((MAX_ROOM_SIZE div 2), (cy - (CONNECT_SIZE * roomHeight))); yy1 < min((height - (MAX_ROOM_SIZE div 2)), (cy + (CONNECT_SIZE * roomHeight))); yy1++) {
        if(obj_levelGenTest2.grid[# xx1, yy1] == CENTER_ROOM && (xx1 != cx || yy1 != cy)) {
            xDistance = xx1 - cx;
            yDistance = yy1 - cy;
            var wallNum = 0;
            var yMove;
            for(yMove = 0 yMove < abs(yDistance) + 1; yMove++) {
                if(wallNum == 2) {
                    break;
                }
                if(obj_levelGenTest2.grid[# cx, cy + (yMove * sign(yDistance))] == WALL) {
                    obj_levelGenTest2.grid[# cx, cy + (yMove * sign(yDistance))] = DOOR;
                    wallNum++;
                }
                if(obj_levelGenTest2.grid[# cx, cy + (yMove * sign(yDistance))] != CENTER_ROOM && obj_levelGenTest2.grid[# cx, cy + (yMove * sign(yDistance))] != DOOR) {
                obj_levelGenTest2.grid[# cx, cy + (yMove * sign(yDistance))] = FLOOR;
                }
            }
            var xMove;
            for(xMove = 0; xMove < abs(xDistance) + 1; xMove++) {
                if(wallNum == 2) {
                    break;
                }
                if(obj_levelGenTest2.grid[# cx + (xMove * sign(xDistance)), cy + (yMove * sign(yDistance))] == WALL) {
                    obj_levelGenTest2.grid[# cx + (xMove * sign(xDistance)), cy + (yMove * sign(yDistance))] = DOOR;
                    wallNum++;
                }
                if(obj_levelGenTest2.grid[# cx + (xMove * sign(xDistance)), cy + (yMove * sign(yDistance))] != CENTER_ROOM && obj_levelGenTest2.grid[# cx + (xMove * sign(xDistance)), cy + (yMove * sign(yDistance))] != DOOR) {
                    obj_levelGenTest2.grid[# cx + (xMove * sign(xDistance)), cy + (yMove* sign(yDistance))] = FLOOR;
                }
            }
        }
    }
}
