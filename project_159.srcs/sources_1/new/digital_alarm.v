module digital_alarm(
input wire clk,rst,
input wire [3:0]set_hour,
input wire [7:0]set_minute,
output reg alarm
);

reg[3:0]  current_hour; 
reg [7:0] current_min;
    
initial begin
  current_hour=0;
  current_min=0;
  alarm=0;
 end
    
 always@(posedge clk or posedge rst)begin
    if(rst)begin
         current_hour=0;
         current_min=0;
         end
     else
          if(current_min<59)
            current_min=current_min+1;                                                                                                     
           else begin
                if(current_hour<23)begin
                   current_hour=current_hour+1;
                    current_min=0;  
                  end
                  else begin
                    current_hour=0;
                    current_min=0;
                  end  
             end  
       if(current_min==set_minute && current_hour==set_hour)
            alarm=1;     
        else
            alarm=0;   
                                                           
   end 

    
    
endmodule
