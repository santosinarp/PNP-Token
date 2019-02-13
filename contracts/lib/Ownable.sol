pragma solidity 0.4.24;

contract Ownable {
    address public owner;

    event transferOwner(address indexed existingOwner, address indexed newOwner);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        if (newOwner != address(0)) {
            owner = newOwner;
            emit transferOwner(msg.sender, owner);
        }
    }
}
