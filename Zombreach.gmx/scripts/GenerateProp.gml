var p = irandom(4);
var prop = noone;
switch(p) {
case 0:
    prop = instance_create(0, 0, AxeProp);
    break;
case 1:
    prop = instance_create(0, 0, BatProp);
    break;
case 2:
    prop = instance_create(0, 0, KnifeProp);
    break;
case 3:
    prop = instance_create(0, 0, PipeProp);
    break;
case 4:
    prop = instance_create(0, 0, BowProp);
    break;
}
return prop;

