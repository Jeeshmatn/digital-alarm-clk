module tb;
reg clk;
reg rst;
reg [3:0]set_hour;
reg  [7:0]set_minute;

wire alarm;


initial begin
    clk=0;
    forever #1 clk=~clk;
 end   

digital_alarm uut( clk,rst,set_hour,set_minute, alarm);

initial begin
$monitor("Time: %0t, set_hour: %d,  set_minute: %d, alarm: %b", $time,set_hour,set_minute, alarm);
rst=0;
set_hour=2;
set_minute=2;
#250
$finish;
end

//always@(posedge clk) $display("Time: %0t, set_hour: %d,  set_minute: %d, alarm: %b", $time,set_hour,set_minute, alarm); 
 


endmodule
