module peripheral_display(clk,rst,d_in,cs,addr,rd,wr,sseg,anodos);

  input clk;
  input rst;
  input [15:0]d_in;
  input cs;
  input [3:0]addr;
  input rd;
  input wr;
 
  output [6:0]sseg;
  output [3:0]anodos;
 
  
reg [15:0] dato;  // Un registro del dato a mostrar


always @(negedge clk) begin//-------------------- escritura de registros 
  // Dato de prueba:
  // dato[15:0]=16'h1234; 
  dato[15:0]  = (cs && wr) ? d_in[15:0] : dato;
end 
display dp (.num(dato),.sseg(sseg), .an(anodos), .rst(rst), .clk(clk));
// num va a al registro dato y lo lee constantemente

endmodule
