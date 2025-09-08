module two_input( a,b, and_out,or_out,nor_out,xor_out,xnor_out,nand_out);
  input a,b;
  output reg and_out,or_out,nor_out,xor_out,xnor_out,nand_out;
  always @(*)
    begin
      and_out = a*b;
      or_out = a+b;
      nor_out =~(a+b);
      xor_out = a^b;
      xnor_out = ~(a^b);
      nand_out = ~(a*b);
    end
endmodule

module two_input_test;
  reg a,b;
  wire and_out,or_out,nor_out,xor_out,xnor_out,nand_out;
   initial begin
    $dumpfile("dump.vcd");         
    $dumpvars(0, two_input_test);   
  end
  two_input uut(
    .a(a),
    .b(b),
    .and_out(and_out),
    .or_out(or_out),
    .nor_out(nor_out),
    .xor_out(xor_out),
    .xnor_out(xnor_out),
    .nand_out(nand_out)
  );
  initial begin
    a=0;b=0;
    #10 a=0; b=1;
    #10 a=1; b=0;
    #10 a=1; b=1;
  end
  initial $monitor("a=%b,b=%b,and_out=%b,or_out=%b,nor_out=%b,xor_out=%b,xnor_out=%b,nand_out=%b",a,b,and_out,or_out,nor_out,xor_out,xnor_out,nand_out);
  initial #20 $finish;
endmodule