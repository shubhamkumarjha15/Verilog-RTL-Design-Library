module and_gate (s,a,b);
  input a,b;
  output reg s;

  always @(*) begin
    s = a & b;
  end
endmodule

// test bench
module and_gate_test;
  reg a;
  reg b;
  wire s;
  
   initial begin
    $dumpfile("dump.vcd");         
    $dumpvars(0, and_gate_test);   
  end

  and_gate uut(
    .a(a),
    .b(b),
    .s(s)
  );
  initial begin
    a = 0; b = 0;
    #2 a = 0; b = 1;
    #2 a = 1; b = 0;
    #2 a = 1; b = 1;
  end

  initial $monitor("a=%b, b=%b, s=%b", a, b, s);
  initial #20 $finish;

endmodule