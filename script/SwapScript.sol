// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {Swap} from "../src/Swap.sol";

import {Script, console2} from "forge-std/Script.sol";


contract SwapScript is  Script{
   function run()external returns(Swap){
         vm.startBroadcast();
         Swap swapping = new Swap(0x14093F94E3D9E59D1519A9ca6aA207f88005918c,0x0f57Bd2d2645D12A11D0085F70C49C3d4E3Dee75, 0x406C2d31F4B61eA0C917F6C02e44aaC9bD10da52, 0x95a0BDbFEeE6179491d7318db3c1D40bc374d56a);
         vm.stopBroadcast();
         return swapping;
   }
}

//address - 0x7EB8C07C0e50F701748c0243F78aB4D0A0180E83
//transaction -hash - 0x14a1ad8f5e02c2eb8ab33a5a889ab1465213acf68f0a3e35e96da174f4f8a1f2