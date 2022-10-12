// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract modifiers {
//state variables owner is defined to be able to set owner in constructor.
//fee is defined so it can be accessed later on
address public owner;
uint private constant Fee = 4;

//custom error for addFund function
error AmountTooSmall(uint value, uint minValue, string reason);

//constructor sets contract to owner on contract initialization so I can later use it in a modifier to make owner only functions.
constructor() {
    owner = msg.sender;
}

//here modifier only Owner is set, with string error if requirement(bool) is not met. _; is modifier specific command after-
//which function code will execute. sandwiching code is possible.
modifier onlyOwner() {
require (msg.sender == owner,"You are not owner of contract" );
_;}

//modifier to check if a user has deposited before. to be used in addFund() function.
modifier hasDeposited () {
require (balance[msg.sender] >= 1, "You have not made your first deposit yet.");
_;}

//modifier to assert if value add is more than Fee.
modifier value(uint _amount) {
if (_amount < Fee) {revert AmountTooSmall ({value: _amount, minValue: Fee, reason:"Add more than minValue."});}
else {
    _;}}

//user struct to be used as user Record for mapping [keytype] address > user details.
//bool value type registered to be able to perform check if user = or != registered.
    struct user{
        string name;
        uint age;
        bool registered;
    }

//2 types of mappings. balance is for keeping track of user balance.
//userDetails is for mapping address to userDetails structs. private so getter functions are inaccessible.
mapping (address => uint) private balance;
mapping (address => user) private userDetails;

//function to setUserdetails > struct. check performed to see if user != already registered.
function setUserDetails(string calldata _name, uint256 _age) public {
require (!userDetails[msg.sender].registered, "User already KYC'ed.");    
        userDetails[msg.sender].name=_name;
        userDetails[msg.sender].age=_age;
        userDetails[msg.sender].registered=true;
}

//function to retrieve userDetails of function caller.
function getUserDetails () public view returns (string memory _name, uint _age) {
    return (_name = userDetails[msg.sender].name, _age = userDetails[msg.sender].age);
}

//allows anyone to deposit into balance. if the value > 0.
function deposit (uint _depositBalance) public {
    require (_depositBalance >= 1, "Cannot deposit 0");
    balance[msg.sender]=_depositBalance;
}

//allows the owner of contract to rug the balance of any address.
function withdraw (address _address, uint _withdrawBalance) public onlyOwner{
   balance[_address] -= _withdrawBalance; 
}

//returns the balance of function caller.
function checkBalance () public view returns (uint _balance){
return (_balance = balance[msg.sender]);
}

//function which add funds if conditions from modifier value(uint _amount) are met. 
// !! Notice here how value(_amount) needs no uint because function already knows to use that value type!!
function addFund (uint _amount) public hasDeposited value(_amount) {
 balance[msg.sender]= balance[msg.sender] + _amount;
}
}