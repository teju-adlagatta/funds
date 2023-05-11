// SPDX-License-Identifier: MIT
pragma solidity <=0.8.18;

contract FundsManaging {
    address owner;
    uint256 withdrawalLimit;
    mapping(address => uint256) public balances;

    constructor(uint256 _withdrawalLimit) {
        owner = msg.sender;
        withdrawalLimit = _withdrawalLimit;
    }
// allowing only owner to modify the contract.
    modifier admin() {
        require(msg.sender == owner, "Only Admin is allowed to perform this action");
        _;
    }

    function setWithdrawalLimit(uint256 _newLimit) public admin {
        withdrawalLimit = _newLimit;
    }

    function withdraw(uint256 _amount) public  {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        require(_amount <= withdrawalLimit, "Exceeds withdrawal limit");
         balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}