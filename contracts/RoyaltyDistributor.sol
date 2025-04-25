// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract RoyaltyDistributor {
    address public owner;
    mapping(address => uint256) public royalties;

    constructor() {
        owner = msg.sender;
    }

    function setRoyalty(address recipient, uint256 amount) external {
        require(msg.sender == owner, "Only owner can set royalties");
        royalties[recipient] = amount;
    }

    function distribute(address[] memory recipients) external {
        for (uint256 i = 0; i < recipients.length; i++) {
            require(royalties[recipients[i]] > 0, "No royalty set");
            payable(recipients[i]).transfer(royalties[recipients[i]]);
        }
    }

    receive() external payable {}
}
