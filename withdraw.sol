pragma solidity ^0.8.7;
//SPDX-License-Identifier: MIT
contract FeeCollector {
    address public owner;
    uint256 public balance;
    constructor() {
        owner = msg.sender;
    }

    receive() payable external{
        balance+=msg.value;
    }
    function withdraw(uint amount, address payable destAddr) public{
        require(msg.sender==owner,"You are not permission");
        require(amount<=balance,"Insufficient funds");

        destAddr.transfer(amount);
        balance -= amount;
    }
}
