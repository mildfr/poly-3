pragma circom 2.0.0;

template LogicalCircuit () {

   // signal input
   signal input A;
   signal input B;

   // signal from gates
   signal m;
   signal n;

   // final signal output
   signal output Q;

   // component gates used to create custom logical LogicalCircuit
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();

   // circuit logic
   andGate.a <== A;
   andGate.b <== B;
   m <== andGate.out;
   notGate.in <== B;
   n <== notGate.out;
   orGate.a <== m;
   orGate.b <== n;
   Q <== orGate.out; 


   // logging value of Q on custom inputs

   log("On custom inputs value of Q is: ", Q);

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = LogicalCircuit();