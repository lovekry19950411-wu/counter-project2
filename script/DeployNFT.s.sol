// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/MyNFT.sol";

contract DeployNFT is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // 用 vm.addr(deployerPrivateKey) 確保 owner 是你指定的帳號
        MyNFT nft = new MyNFT(vm.addr(deployerPrivateKey));
        console.log("MyNFT deployed at:", address(nft));

        vm.stopBroadcast();
    }
}