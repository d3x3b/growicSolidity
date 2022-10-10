pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT
contract PrimitiveDataTypes {

 address public owner;
    constructor() {
    owner=msg.sender;
  } 

 modifier onlyOwner(){
  require(msg.sender == owner,"You are not the owner!");
  _;
 }

 function setOwner(address _newOwner) public onlyOwner{
  require(_newOwner != address(0), "burner address is invalid input");
  owner =_newOwner;
 }

struct StudentID {
  string name;
  uint8 percentage;
  uint8 totalMarks;
  bool inSystem;
}

mapping(address => StudentID) public studentRecord;

function registerStudent(address _addr, string memory _name, uint8 _percentage, uint8 _totalMarks) public onlyOwner {
require(!studentRecord[_addr].inSystem,"Student already registered");
studentRecord[_addr].name=_name;
studentRecord[_addr].percentage=_percentage;
studentRecord[_addr].totalMarks=_totalMarks;
studentRecord[_addr].inSystem=true;
}

function getStudentdetails(address _addr) public view returns (string memory _name, uint _percentage, uint  _totalMarks){
return (studentRecord[_addr].name, studentRecord[_addr].percentage, studentRecord[_addr].totalMarks);
}
}
