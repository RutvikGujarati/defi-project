// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {FlashLoan} from "../src/Flsahloan.sol";

contract FlashTest is Test {
    FlashLoan public loan;
    address A_loan = 0xA238Dd80C259a72e81d7e4664a9801593F98d1c5;

    function setUp() public {
        loan = new FlashLoan(A_loan);
    }

    function test_executeOperation(address asset, uint256 x, uint256 y, address initiator, bytes calldata u) public{
           loan.executeOperation(asset, x, y, initiator, u);
    }


}
