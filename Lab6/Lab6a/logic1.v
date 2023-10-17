// CPEN 230L Lab 6a, Combinational Logic
// Gabe DiMartino, 10/17/2023

module logic1(W, X, Y, Z);
output W;
input X, Y, Z;
wire P, Q;

// structural model
not(P, Y);
or(Q, X, P);
and(W, Q, Z);

endmodule

/* commented-out alternate implementation

module logic1(W, X, Y, Z);
output W;
input X, Y, Z;

// behavioral model
assign W = (X || !Y) && Z;
endmodule
*/