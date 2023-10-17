//CPEN 230L Lab 6b fullAdder logic
//Gabe DiMartino 10/16/2023

module fullAdder (input A, input B, input Cin, output Sum, output Cout);
    assign {Cout, Sum} = A + B + Cin;
endmodule