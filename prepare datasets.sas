
data clk.testdata;
set clk.testdata;
date_ = substr(timeat,1,10);
hour_=substr(timeat,12,2);
minute_=substr(timeat,15,2);
run;

data clk.testdata;
set clk.testdata;
hour=hour_+0;
minute=minute_+0;
run;

data clk.testdata;
set clk.testdata;
drop hour_ minute_;
run;

data clk.testdata;
set clk.testdata;
day_ = substr(date_,9,2);
month_ = substr(date_,6,2);
year_ = substr(date_,1,4);
run;

data clk.testdata;
set clk.testdata;
day=day_+0;
month=month_+0;
year=year_+0;
run;


data clk.testdata;
set clk.testdata;
drop day_ month_ year_;
run;

proc contents data = clk.testdata;
run;

data clk.testdata;
set clk.testdata;
if hour>=6 and hour<=11 then
	period="Morning";
else if hour>=12 and hour<=17 then
	period="Afternoon";
else if hour>=18 and hour<=23 then
	period="Evening";
else
	period="Night";
run;

data clk.testdata;
set clk.testdata;
concatid=cats(referer,agent,cntr,cid,iplong);
run;
