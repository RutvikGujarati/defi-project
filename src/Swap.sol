// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Swap is IERC20 {

    address public Person1;
    IERC20 public Token1;
    address public Person2;
    IERC20 public Token2;

    constructor(
        address _p1,
        address _p2,
        address _T1,
        address _T2
    ) {
        Token1 = IERC20(_T1);
        Token2 = IERC20(_T2);
        Person1 = _p1;
        Person2 = _p2;
    }

    function swap(uint256 _amount1, uint256 _amount2) public {
        require(msg.sender == Person1 || msg.sender == Person2, "You are not allowed");

        require(Token1.allowance(Person1, address(this)) >= _amount1, "You have not enough token for swapping");
        require(Token2.allowance(Person2, address(this)) >= _amount2, "You have not enough token for swapping");

        // Swap tokens
        safeTransfer(Token1, Person1, Person2, _amount1);
        safeTransfer(Token2, Person2, Person1, _amount2);
    }

    function safeTransfer(IERC20 token, address sender, address recipient, uint256 amount) private {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Transfer not successful");
    }

    // Implementing required functions from IERC20
    function totalSupply() external view override returns (uint256) {
        // Implement your logic for totalSupply
    }

    function balanceOf(address account) external view override returns (uint256) {
        // Implement your logic for balanceOf
    }

    function transfer(address recipient, uint256 amount) external override returns (bool) {
        // Implement your logic for transfer
    }

    function allowance(address owner, address spender) external view override returns (uint256) {
        // Implement your logic for allowance
    }

    function approve(address spender, uint256 amount) external override returns (bool) {
        // Implement your logic for approve
    }

    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        // Implement your logic for transferFrom
    }
}
