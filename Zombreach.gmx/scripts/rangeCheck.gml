cell1 = argument0;
cell2 = argument1;
maxRange = argument2;
rangeType = argument3;

distance = ManhattanDistance(cell1, cell2);
if(rangeType & global.RANGE_DISTANCE && distance > maxRange)
    return false;
if(rangeType & global.RANGE_LINE && !IsAligned(cell1, cell2))
    return false;
if(rangeType & global.RANGE_JUMP_1 && distance == 1)
    return false;
if(rangeType & global.RANGE_SELF && distance > 0)
    return false;
if(rangeType & global.RANGE_MELEE && distance != 1)
    return false;
if(rangeType & global.RANGE_SQUARE) {
    if(distance > 2)
        return false;
    if(distance == 2 && (cell1.indexX == cell2.indexX || cell1.indexY == cell2.indexY))
        return false;
}
    
return true;
