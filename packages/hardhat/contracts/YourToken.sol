pragma solidity 0.8.4;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
// learn more: https://docs.openzeppelin.com/contracts/3.x/erc20

contract YourToken is ERC20 {
     constructor() public ERC20("YourToken", "MYT") {
       _mint(msg.sender, 1000*10**18);
    }
}
