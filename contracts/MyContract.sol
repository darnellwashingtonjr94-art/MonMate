// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyContract {
    string public message;
    address public owner;

    event MessageUpdated(address indexed sender, string newMessage);

    constructor(string memory _message) {
        message = _message;
        owner = msg.sender;
    }

    function setMessage(string memory _newMessage) public {
        require(msg.sender == owner, "Only owner can update the message");
        message = _newMessage;
        emit MessageUpdated(msg.sender, _newMessage);
    }
}
