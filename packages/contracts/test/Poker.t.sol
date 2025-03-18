// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Poker} from "../src/Poker.sol";

contract PokerTest is Test {
    Poker poker;
    address admin;
    address user;

    function setUp() public {
        admin = address(this);
        user = address(0xBEEF);
        poker = new Poker();
    }

    function testIncrement() public {
        poker.increment(suint256(5));
        assertEq(poker.viewCounter(), 5);
    }

    function testMultipleIncrements() public {
        poker.increment(suint256(3));
        poker.increment(suint256(7));

        assertEq(poker.viewCounter(), 10);
    }

    function testOnlyAdminCanViewCounter() public {
        vm.prank(user);
        vm.expectRevert("Only admin can call this function");
        poker.viewCounter();
    }

    function testAdminCanViewCounter() public {
        poker.increment(suint256(5));

        uint256 counterValue = poker.viewCounter();
        assertEq(counterValue, 5);
    }
}
