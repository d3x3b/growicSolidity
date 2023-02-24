// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract structs {

    struct user{
        string name;
        uint age;
        bool registered;
    }

mapping (address => uint) private balance;
mapping (address => user) private userDetails;

function setUserDetails(string memory _name, uint256 _age) public {
require (!userDetails[msg.sender].registered, "User already KYC'ed.");    
        userDetails[msg.sender].name=_name;
        userDetails[msg.sender].age=_age;
        userDetails[msg.sender].registered=true;
}

function getUserDetails () public view returns (string memory _name, uint _age) {
    if (userDetails[msg.sender] == true{
    return (_name = userDetails[msg.sender].name, _age = userDetails[msg.sender].age);
}
}

function deposit (uint _depositBalance) public {
    require (_depositBalance >= 1, "Cannot deposit 0");
    balance[msg.sender]=_depositBalance;
}

function checkBalance () public view returns (uint _balance){
return (_balance = balance[msg.sender]);
}
}
