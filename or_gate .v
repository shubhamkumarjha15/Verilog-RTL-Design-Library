module or_gate(a,b,c);
  input a,b;
  output reg c;
  always @(*)
    begin
      c =a|b;
    end
endmodule

// test bench

module or_gate_test;
  reg t_a;
  reg t_b;
  wire t_c;

  // Instantiate the or_gate module
  or_gate uut(
    .a(t_a),
    .b(t_b),
    .c(t_c)
  );

  // Dump signals to VCD file
  initial begin
    $dumpfile("dump.vcd");         
    $dumpvars(0, or_gate_test);   
  end

  // Apply test inputs
  initial begin
    t_a = 0; t_b = 0;
    #2 t_a = 0; t_b = 1;
    #2 t_a = 1; t_b = 1;
  end

  // Display the output
  initial $monitor("t_a=%b , t_b=%b , t_c=%b", t_a, t_b, t_c);

  // End simulation
  initial #20 $finish;
endmodule