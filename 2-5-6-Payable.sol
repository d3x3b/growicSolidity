// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Payable {

//mapping from address to uint which shows the 
//balance of a user if interacted with.
mapping (address => uint) public balance;

//function accepts ETH through payable modifier.
//function maps the value deposited to user address
function deposit payable() public {
        balance[msg.sender] += msg.value;
}

//function to check the balance of user.
function checkBalance () public view returns (uint _balance){
return (_balance = balance[msg.sender]);
}
}
