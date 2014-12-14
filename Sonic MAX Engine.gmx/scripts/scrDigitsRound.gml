/*-----------------------------------------
digits_round(number, place)

number - the number to round
place - the decimal place to round to

(1 = tens, 0 = singles, -1 = tenths, etc.)

-CubinJ
------------------------------------------*/

var num_rnd, place;

num_rnd = argument0;
place = argument1;

num_rnd = round(num_rnd * power(10, place * -1)) * power(10, place);


return num_rnd;