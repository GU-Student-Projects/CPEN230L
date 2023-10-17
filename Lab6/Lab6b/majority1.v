//CPEN 230L Lab 6b majority logic
//Gabe DiMartino 10/16/2023

// Define the module
module majority (
    //Three "switch" inputs
    input a,
    input b,
    input c,
    output y //LED output
);

// Define three 2-input AND gates
and gate1 (and1, a, b);
and gate2 (and2, a, c);
and gate3 (and3, b, c);

// Define two 3-input OR gates
or or_gate1 (or1, and1, and2, and3);
or or_gate2 (y, a, b, c);

endmodule
