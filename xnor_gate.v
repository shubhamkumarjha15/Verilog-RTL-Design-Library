module xnor_gate(a,b,c);
  input a,b;
  output reg c;
  
  always @(*) begin
    c=~(a^b);
  end
    endmodule
    
    // test bench
    module xnor_gate_test;
  reg a,b;
  wire c;
  initial begin
    $dumpfile("dump.vcd");         
    $dumpvars(0, xnor_gate_test);   
  end
    
  xnor_gate uut(
    .a(a),
    .b(b),
    .c(c)
  );
  initial begin 
    a=0; b=0;
    #5 a=0; b=1;
    #5 a=1; b=0;
    #5 a=1;b=1;
  end
  initial $monitor("a=%b,b=%b,c=%b",a,b,c);
  initial #20 $finish;
endmodule