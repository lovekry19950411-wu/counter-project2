// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SmartWallet.sol";

contract SmartWalletTest is Test {
    SmartWallet wallet;
    address owner;
    address receiver;

    function setUp() public {
        owner = address(0xABC);   // 測試用的外部帳號
        receiver = address(0x123);
        wallet = new SmartWallet(owner);

        // 給 owner 一些 ETH，避免 deposit 時 Revert
        vm.deal(owner, 10 ether);
    }

    function testDeposit() public {
        vm.prank(owner);
        wallet.deposit{value: 1 ether}();
        assertEq(wallet.getBalance(), 1 ether, unicode"存款後餘額應為 1 ETH");
    }

    function testWithdraw() public {
        vm.prank(owner);
        wallet.deposit{value: 2 ether}();

        vm.prank(owner);
        wallet.withdraw(1 ether);

        assertEq(wallet.getBalance(), 1 ether, unicode"提款後餘額應為 1 ETH");
    }

    function testTransfer() public {
        vm.prank(owner);
        wallet.deposit{value: 2 ether}();

        vm.prank(owner);
        wallet.transfer(receiver, 1 ether);

        assertEq(wallet.getBalance(), 1 ether, unicode"轉帳後餘額應為 1 ETH");
    }
}