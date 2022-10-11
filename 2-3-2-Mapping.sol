// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Mapping {

mapping (address => uint) public balance;

function deposit (uint _depositBalance) public {
    require (_depositBalance >= 1, "Cannot deposit 0");
    balance[msg.sender]=_depositBalance;
}

function checkBalance () public view returns (uint _balance){
return (_balance = balance[msg.sender]);
}
}
