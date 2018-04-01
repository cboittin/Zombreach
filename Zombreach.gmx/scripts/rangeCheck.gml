cell1 = argument0;
cell2 = argument1;
maxRange = argument2;
rangeType = argument3;

distance = ManhattanDistance(cell1, cell2);
if(distance > maxRange)
    return false;
if(rangeType & global.RANGE_LINE && !IsAligned(cell1, cell2))
    return false;
if(rangeType & global.RANGE_JUMP_1 && distance == 1)
    return false;
    
return true;
