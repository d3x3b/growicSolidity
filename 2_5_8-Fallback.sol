// SDPX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Fallback {
    event Log(string _func, address _sender, uint _value, bytes _data);

    //fallback is executed when non-existing function is called but with non-empty msg.data,
    // would also be triggered if no receive function is defined in the contract.
    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    // receive is triggered when msg.data is empty on a non-existing function
    // both receive and fallback can receive ether because of the payable modifier.
    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}

contract FallbackSend {
    // transfer uses about 1300 gas more than send
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    // send is one function to send funds to a contract, uses about 1300 gas less than transfer
    // but has some drawdowns i don't yet fully grasp.
    function sendToFallback(address payable _to) public payable {
        _to.send(msg.value);
    }
    // haven't been able to send any wei or ether using this way of sending yet.
    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
