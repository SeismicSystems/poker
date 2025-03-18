// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Poker {
    suint256 private counter;
    address private admin;

    constructor() {
        counter = suint256(0);
        admin = msg.sender;
    }

    function increment(suint256 amount) public {
        counter += amount;
    }

    function viewCounter() public view onlyAdmin returns (uint256) {
        return uint256(counter);
    }

    modifier onlyAdmin() {
        if (msg.sender != admin) {
            revert("Only admin can call this function");
        }
        _;
    }
}
