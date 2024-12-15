module aximaster #(parameter size=4,parameter len=8,parameter typ=0 ) (
   
   //global signals
    input  aclk,
    input  resetn,
   //size,length,brsut type
    input [8:0] bsize ,
    input [5:0] blen ,
    input [1:0] btyp ,
    //start write , read adress
    input  [(size*8)-1:0] wadd,
    input  [(size*8)-1:0] radd,
    
    input  [(size*8)-1:0] datain,
    output reg [(size*8)-1:0] dataout,
    input dlast,


    //write address channel
    output reg awvalid,
    input  awready,
    output reg [(size*8)-1:0] awadd,
    
    //write data channel
    output reg wvalid,
    input  wready,
    output reg [(size*8)-1:0] wdata,
    output reg wlast,
  

   //write response channel
    output reg bready,
    input  bvalid,
    input  [1:0] bresp,
    
    //read address channel
    output reg arvalid,
    input  aready,
    output reg [(size*8)-1:0] aradd,
    

    //read data channel
    input  rvalid,
    output reg rready,
    input  [(size*8)-1:0] rdata,
    input  rlast
   );

      
   always@(posedge aclk)begin
   if(!resetn)begin
       awvalid=0;
       arvalid=0;
       wvalid=0;
       wdata=0;
       awadd=0;
       aradd=0;
       bready=0;
       rready=0;
       wlast=0;
       dataout=0;
   end
   else begin  //*****************************::waddr ch******************************************************************/
       awvalid=1;
       if(awready)begin
           awadd=wadd;
       end
       else begin
           awadd=0;
       end
   end
   end

   always @(posedge aclk)begin //*************::wdtata ch*****************************************************************/
   if(resetn)begin
     wvalid=1;
     if(wready)begin
         wdata=datain;
         wlast=dlast;
     end
     else begin
         wdata=0;
     end
   end
   end


   always@(posedge aclk)begin //**********************::wresp ch*******************************************************/
   if(resetn)begin
        if(wvalid&&wready&&bvalid)begin
            bready=1;
        end
        else begin
            bready=0;
        end
     
   end
   end

    always@(posedge aclk)begin //*********************::raddr ch******************************************************/
    if(resetn)begin
        arvalid=1;
        if(aready)begin
            aradd=radd;
        end
        else begin
            aradd=0;
        end
 
   end
   end

   always@(posedge aclk)begin //**********************::rdata ch***********************************************************/
   if(resetn)begin
      if(arvalid&&aready&&rvalid)begin
          rready=1;
      end
      else begin
          rready=0;
          dataout=0;
      end

      dataout=rdata;
   end
   end
   endmodule



