// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/SmartWallet.sol";

contract DeployWallet is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deploy SmartWallet
        SmartWallet wallet = new SmartWallet(msg.sender);
        console.log("SmartWallet deployed at:", address(wallet));

        vm.stopBroadcast();
    }
}