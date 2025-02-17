delimiter //
create procedure p_3(chk integer, out b BOOLEAN)
begin
declare var1 int;
set var1 = chk;
set @v = (select dist from t13 where repno = var1);
if @v<>0 then
set b = 1;
else
set b = 0;
end if;
end;
// 
