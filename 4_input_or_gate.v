module four_input_or(a,b,c,d,s);
  input a,b,c,d;
  output reg s;
  always @(*) begin
    s=(a+b+c+d);
  end
endmodule

module four_input_or_test;
  reg a,b,c,d;
  wire s;
 initial begin
  $dumpfile("dump.vcd");         
  $dumpvars(0, four_input_or_test);   
end

  four_input_or uut(
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );
  initial begin 
    {a, b, c, d} = 4'b0000;
    #10 {a, b, c, d} = 4'b0001;
    #10 {a, b, c, d} = 4'b0010;
    #10 {a, b, c, d} = 4'b0100;
    #10 {a, b, c, d} = 4'b0101;
    #10 {a, b, c, d} = 4'b0110;
    #10 {a, b, c, d} = 4'b0111;
    #10 {a, b, c, d} = 4'b1000;
    #10 {a, b, c, d} = 4'b1001;
    #10 {a, b, c, d} = 4'b1010;
    #10 {a, b, c, d} = 4'b1011;
    #10 {a, b, c, d} = 4'b1100;
    #10 {a, b, c, d} = 4'b1101;
    #10 {a, b, c, d} = 4'b1110;
    #10 {a, b, c, d} = 4'b1111;
  end;
  initial $monitor("a=%b,b=%b,c=%c,s=%s",a,b,c,s);
  initial #20 $finish;
endmodule