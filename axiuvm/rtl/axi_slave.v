module axislave #(parameter size=4,parameter len=8,parameter typ=2) (
    input  aclk,
    input  resetn,
    input  transfer,
    input [8:0] bsize ,
    input [5:0] blen ,
    input [1:0] btyp ,

    input  awvalid,
    output reg awready,
    input  [(size*8)-1:0] awadd,

    input  wvalid,
    output reg wready,
    input  [(size*8)-1:0] wdata,
    input  wlast,
   
    input  bready,
    output reg bvalid,
    output reg [1:0] bresp,
    

    input  arvalid,
    input  [(size*8)-1:0] aradd,
    output reg aready,

    output reg rvalid,
    input  rready,
    output reg [(size*8)-1:0] rdata, 
    output reg rlast
);

     reg [(size*8)-1:0] mem[500:0];
     reg[(size*8)-1:0] wdd=0,rdd=0;
     reg[5:0]rcount=0;
     reg [5:0] wcount=0;
     reg [31:0]wrapwb=0,wraprb=0;
     reg [31:0]waddrn=0,raddrn=0;
     reg [(size*8)-1:0]iraligend=0,iwaligend=0,wrwaligend=0,wrraligend=0;
     integer n=1,k=1;
     reg[7:0] wtemp=0,rtemp=0;
     integer i;

    reg wselect=0,rselect=0;
   
   always@(posedge aclk)begin   
   if(!resetn|| !transfer)begin
      awready=0;
      wready=0;
      bvalid=0;
      bresp=0;
      aready=0;
      rvalid=0;
      rdata=0;
      rlast=0;

      wdd=0;
      rdd=0;
      rcount=0;
      wcount=0;
       wrapwb=0;
       wraprb=0;
       waddrn=0;
       raddrn=0;
       iraligend=0;
       iwaligend=0;
       wrwaligend=0;
       wrraligend=0;
        n=1;
        k=1;
       wtemp=0;
       rtemp=0;
       wselect=0;
       rselect=0;
       rdata=0;
       if(!resetn)begin
         for( i=0;i<501;i=i+1)begin
          mem[i]=0;
         end
           end
    end
   else if(resetn&&transfer) begin
/********************************************WADDERS CH*****************************************************/      
          if (awvalid&&bresp==0) begin  
           awready=1;
           case(wselect)
           0:begin
             if(awadd)begin
                  iwaligend=(awadd/bsize)*bsize;
                  wrwaligend=(awadd/bsize)*bsize;
                  wrapwb=((wrwaligend/(blen*bsize))*(blen*bsize));
                  waddrn=wrapwb+(blen*bsize);
                  wdd= wrwaligend;
                  wselect=1;
             end
             else 
                 wselect=0;

             end
           1:begin
               case(btyp)
                 0:begin
                    wdd=(awadd/bsize)*bsize;
                    wcount=1;
                   end
                 1:begin
                    if(n<=blen)  begin                                
                      wdd=iwaligend+(n-1)* bsize;
                      n=n+1;                   
                    end
                    else begin
                        wdd=0;
                        end
                    end
                2:begin
                         
                         if(wcount<blen)begin
                                wdd=wdd+wtemp;
                                wtemp=bsize;
                                wcount=wcount+1;

                              if(wdd>=waddrn)
                                  wdd=wrapwb;
                              
                              else 
                                  wdd=wdd;
                              
                         end 
                         else 
                             wdd=0;
                          

                   end
                 endcase
             end
           endcase
        end
      else begin
         wdd=0;
      end
/********************************************************************************************************************************/
/*************************************************WDATA CH*************************************************************************/
     if(resetn&&wvalid&&transfer&&bresp==0)begin
       wready=1;
         if(wdd)
           mem[wdd]=wdata;
         else
           mem[wdd]=0;
       end
       else begin
         wready=0;
        end
/*********************************************************************************************************************************/
   
   end

   else begin
      wdd=0;
   end
   end


/************************************************WRESPONSE CH********************************************************************/

   always@(posedge aclk)begin
   if(resetn&&transfer)begin
   if(awvalid&&wvalid&&wready)begin
       bvalid=1;
       if(awadd>501||wdd>501)
          bresp=2;
       else
          bresp=0;
   end
   else begin
       bvalid=0;
   end
   end
   end
/*******************************************************************************************************************************/

/*************************************************RADDRES CH**************************************************************************/

 always@(posedge aclk)begin
        if(resetn&&transfer)begin
                        case(btyp)
                                 0:begin
                                      if ( arvalid&&wlast)begin
                                                   aready=1;
                                                    case(rselect)
                                                       0:begin
                                                             if(aradd)begin
                                                                    iraligend=(aradd/bsize)*bsize;
                                                                     wrraligend=(aradd/bsize)*bsize;
                                                                     wraprb=((wrraligend/(blen*bsize))*(blen*bsize));
                                                                    raddrn=wraprb+(blen*bsize);
                                                                    rdd=wrraligend;
                                                                    rselect=1;
                                                              end
                                                              else 
                                                                     rselect=0;

                                                         end
                                                       1:begin
                                                                    rdd=(aradd/bsize)*bsize;
                                                                        rcount=1;
                                                                         rlast=1;
                                                         end
                                                      endcase

                                       end
                                   end

                               1:begin
                                   if ( arvalid&&n>1)begin
                                               aready=1;
                                                 case(rselect)
                                                           0:begin
                                                                 if(aradd)begin
                                                                       iraligend=(aradd/bsize)*bsize;
                                                                        wrraligend=(aradd/bsize)*bsize;
                                                                        wraprb=((wrraligend/(blen*bsize))*(blen*bsize));
                                                                        raddrn=wraprb+(blen*bsize);
                                                                      rdd=wrraligend;
                                                                      rselect=1;
                                                                    end
                                                                   else 
                                                                      rselect=0;

                                                               end
                                                          1:begin

                                                                  if(k<=blen)  begin
                                                                        rdd = iraligend +(k-1)* bsize;
                                                                        k=k+1;
                                                                        rcount=rcount+1;
                                                                              if(rcount==blen)
                                                                                        rlast=1;
                                                                              else
                                                                                        rlast=0;
                                                                     end
                                                                     else begin
                                                                              rdd=0;
                                                                     end

                                                          end
                                                     endcase

                                      end

                                  end
                           2:begin
                                  if ( arvalid&&wcount>1)begin
                                              aready=1;
                                              case(rselect)
                                                         0:begin
                                                             if(aradd)begin
                                                                      iraligend=(aradd/bsize)*bsize;
                                                                      wrraligend=(aradd/bsize)*bsize;
                                                                      wraprb=((wrraligend/(blen*bsize))*(blen*bsize));
                                                                      raddrn=wraprb+(blen*bsize);                                                                                                                       rdd=wrraligend;
                                                                      rselect=1;
                                                              end
                                                                else 
                                                                      rselect=0;

                                                            end
                                                         1:begin
                                                                    if(rcount<blen) begin
                                                                               rdd=rdd+rtemp;
                                                                               rtemp=bsize;
                                                                               rcount=rcount+1;
                                                                               if(rdd>=raddrn)begin
                                                                                      rdd=wraprb;
                                                                               end
                                                                               else begin
                                                                                        rdd=rdd;
                                                                               end
                                                                        end 
                                                                       else begin
                                                                                rdd=0;
                                                                       end


                                                                      if(rcount==blen)
                                                                                  rlast=1;
                                                                       else
                                                                                 rlast=0;

                                                             
                                                            end
                                                      endcase

                                      end

                             end
                         endcase
        end
        else begin
           rdd=0;
        end
  


/***********************************************RDATA CH*****************************************************************************/
  if(resetn&&arvalid&&aready&&transfer)begin
      rvalid=1;
      case(btyp)
         0:begin
             if(rready&&wlast)begin 
                  rdata=mem[rdd];
             end
             else begin
                  rdata=0;
              end
           end
         1:begin
             if(rready&&n>1)begin 
                  rdata=mem[rdd];
             end
             else begin
                  rdata=0;
              end

           end
         2:begin
             if(rready&&wcount>1)begin 
                  rdata=mem[rdd];
             end
             else begin
                  rdata=0;
              end

           end
      endcase
  end
  else begin
      rvalid=0;
  end
/***************************************************************************************************************************************/
 

   end



endmodule


