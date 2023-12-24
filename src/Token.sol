// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor() ERC20("Doge", "DG") {
        _mint(msg.sender, 100000000 * (1000 ** 18));
    }
}

// t. hash 1)- 0x0e6c589e0575d4c93a36bf522af8770c4263000271c60cb186d4c6300bd5fadf
// address - 0x406C2d31F4B61eA0C917F6C02e44aaC9bD10da52
//from - 0x14093F94E3D9E59D1519A9ca6aA207f88005918c

//t. hash 2) - 0x028e0f367b5a7bd64bd2452a5fb2a113a3d5e08e3dfcbd412c8cb94caaae81b3
//address - 0x95a0BDbFEeE6179491d7318db3c1D40bc374d56a
