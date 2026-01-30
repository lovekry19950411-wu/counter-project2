// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SmartWallet {
    address public owner;

    event Deposited(address indexed from, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);
    event Transferred(address indexed to, uint256 amount);

    constructor(address _owner) {
        owner = _owner; // 部署時指定擁有者
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function deposit() public payable {
        require(msg.value > 0, "Must send ETH");
        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) public onlyOwner {
        require(address(this).balance >= amount, "Insufficient balance");
        payable(owner).transfer(amount);
        emit Withdrawn(owner, amount);
    }

    function transfer(address to, uint256 amount) public onlyOwner {
        require(address(this).balance >= amount, "Insufficient balance");
        payable(to).transfer(amount);
        emit Transferred(to, amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}