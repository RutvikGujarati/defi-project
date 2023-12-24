// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Swap} from "../src/Swap.sol";
import {IERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract TestSwap is Test {
    Swap public Swapped;

    function setUp() public {
        // Deploy a new Swap contract for each test
        Swapped = new Swap(
            address(0x14093F94E3D9E59D1519A9ca6aA207f88005918c),
            address(0x0f57Bd2d2645D12A11D0085F70C49C3d4E3Dee75),
            address(0x406C2d31F4B61eA0C917F6C02e44aaC9bD10da52),
            address(0x95a0BDbFEeE6179491d7318db3c1D40bc374d56a)
        );
    }

    function testSwap() public {
        // Ensure that the contract creator is either Person1 or Person2
        assert(
            Swapped.Person1() == msg.sender || Swapped.Person2() == msg.sender
        );

        // Print initial balances
        console.log(
            "Initial balance of Token1:",
            Swapped.getBalance(0x14093F94E3D9E59D1519A9ca6aA207f88005918c)
        );
        console.log(
            "Initial balance of Token2:",
            Swapped.getBalance(0x0f57Bd2d2645D12A11D0085F70C49C3d4E3Dee75)
        );

        // Call the swap function with valid amounts
        Swapped.swap(100, 150);

        // Print balances after swap
        console.log(
            "Final balance of Token1:",
            Swapped.getBalance(0x14093F94E3D9E59D1519A9ca6aA207f88005918c)
        );
        console.log(
            "Final balance of Token2:",
            Swapped.getBalance(0x0f57Bd2d2645D12A11D0085F70C49C3d4E3Dee75)
        );

        // Assert that the balances have been updated accordingly
        assert(
            Swapped.getBalance(0x14093F94E3D9E59D1519A9ca6aA207f88005918c) ==
                100
        );
        assert(
            Swapped.getBalance(0x0f57Bd2d2645D12A11D0085F70C49C3d4E3Dee75) ==
                150
        );
    }

    function testSwapFail() public {
        // Call the swap function with an invalid sender
        // bool success = Swapped.swap(100, 100);
        // Assert that the swap fails
        // assert(!success);
    }

    // function testWithdraw() public {
    //     // Call the withdraw function
    //     Swapped.withdraw(0x14093F94E3D9E59D1519A9ca6aA207f88005918c);

    //     // Assert that the balance of Person1 has been updated
    //     assert(Swapped.getBalance(0x14093F94E3D9E59D1519A9ca6aA207f88005918c) == 0);
    // }
}
