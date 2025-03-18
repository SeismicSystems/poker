// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Poker} from "../src/Poker.sol";

contract PokerScript is Script {
    function run() public {
        vm.startBroadcast();

        // Deploy the Poker contract
        new Poker();

        vm.stopBroadcast();
    }
}
