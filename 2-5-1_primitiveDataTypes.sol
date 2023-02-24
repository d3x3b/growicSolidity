pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT
contract PrimitiveDataTypes {

//signed integer numbers range from their value (or 256 for int) 
//so for int8 === -2 ** 7  up to 2 ** 7 -1 including 0.
int8 minusnumber = -10;
//unsigned integers are used to store/calculate with non-zero numbers
// in the case of uint16 of up to 2**16
uint16 plusnumber = 100000;
//booleans are used to register simple true or false states. We can use it to help us keep
//track of all kind of data and mappings. In this example I use it to see if the user is registered.
bool userRegistered = true;
//address are *20bytes* long byte value, appended by 0x. The following address is 'payable' which
//holds the additional members transfer and send.
address payable myContractAddress = 0x111122223333444455556666777788889999aAaa;
//enumerables are user defined (user as in contract writer) data types. In the following enum two values
//are possible. either OFF(0) or ON(1)
enum ToggleSwitch{
    OFF,
    ON
}
//this is a dynamically-sized byte array. a byte consisting of 8bit (0 | 1). 
//the array size is between 1 and 32 bytes
bytes a = 0xb5 // == [10110101] ==
bytes1 b = 0xb5 
}