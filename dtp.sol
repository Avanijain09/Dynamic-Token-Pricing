// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicPricingToken {
    mapping(address => uint256) balances;
    mapping(address => bool) hasPurchased;
    uint256 public totalSupply;
    uint256 public tokenPrice;
    uint256 public basePrice;
    uint256 public priceMultiplier;

    function initialize() public {
        totalSupply = 1000000; // Initial token supply
        basePrice = 1e16; // 0.01 ETH
        tokenPrice = basePrice;
        priceMultiplier = 1e14; // Incremental price change factor
        balances[msg.sender] = totalSupply; // Assign all tokens to the deployer
    }

    function buyTokens(uint256 amount) public payable {
        require(amount > 0, "Amount must be greater than zero");
        uint256 cost = amount * tokenPrice;
        require(msg.value >= cost, "Insufficient ETH");

        require(balances[msg.sender] + amount <= totalSupply, "Not enough tokens available");
        balances[msg.sender] += amount;
        adjustPrice(amount, true);
    }

    function sellTokens(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient token balance");

        uint256 refund = amount * tokenPrice;
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(refund);
        adjustPrice(amount, false);
    }

    function adjustPrice(uint256 amount, bool isBuying) internal {
        if (isBuying) {
            tokenPrice += amount * priceMultiplier;
        } else {
            if (tokenPrice > basePrice) {
                tokenPrice -= amount * priceMultiplier;
            }
        }
    }

    function checkBalance(address account) public view returns (uint256) {
        return balances[account];
    }

    function checkPrice() public view returns (uint256) {
        return tokenPrice;
    }
}
