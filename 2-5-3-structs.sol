// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract structs {
    struct user {
        string name;
        uint256 age;
        bool registered;
    }

    mapping(address => uint256) private balance;
    mapping(address => user) private userDetails;

    function setUserDetails(string calldata _name, uint256 _age) public {
        require(!userDetails[msg.sender].registered, "User already KYC'ed.");
        userDetails[msg.sender].name = _name;
        userDetails[msg.sender].age = _age;
        userDetails[msg.sender].registered = true;
    }

    function getUserDetails()
        public
        view
        returns (string memory _name, uint256 _age)
    {
        require(userDetails[msg.sender].registered, "User did not register");
        return (
            _name = userDetails[msg.sender].name,
            _age = userDetails[msg.sender].age
        );
    }

    function deposit(uint256 _depositBalance) public {
        require(_depositBalance >= 1, "Cannot deposit 0");
        balance[msg.sender] = _depositBalance;
    }

    function checkBalance() public view returns (uint256 _balance) {
        return (_balance = balance[msg.sender]);
    }
}
