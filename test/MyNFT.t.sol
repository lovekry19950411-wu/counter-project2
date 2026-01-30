// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT nft;
    address owner;
    address user;

    function setUp() public {
        owner = address(0xABC);
        user = address(0x123);
        nft = new MyNFT(owner);
    }

    function testMint() public {
        vm.prank(owner); // 模擬 owner 呼叫
        nft.mint(user);
        assertEq(nft.ownerOf(0), user, unicode"NFT 擁有者應該是 user");
    }
}