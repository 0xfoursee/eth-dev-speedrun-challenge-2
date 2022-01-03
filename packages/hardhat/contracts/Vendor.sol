pragma solidity 0.8.4;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable{

  YourToken yourToken;
  uint256 public constant tokensPerEth = 100;

  event BuyTokens(address buyer, uint256 amountOfEth, uint256 amountOfTokens);

  constructor(address tokenAddress) public {
    yourToken = YourToken(tokenAddress);
  }

  function buyTokens() public payable returns (bool) {
    // msgs.value only used when dealing with eth balances
    uint token_amount = (tokensPerEth * msg.value) / 1 ether;
    yourToken.transfer(msg.sender, token_amount);
    emit BuyTokens(msg.sender, msg.value, token_amount);
    return true;
  }


  function withdraw(uint256 amount) public onlyOwner returns (bool) {
    payable(owner()).transfer(amount);
    return true;
  }

  function sellTokens(uint256 token_amount) public returns (bool) {
    // requiresApproval-like check done inside ERC20.transferFrom()
    yourToken.transferFrom(msg.sender, address(this), token_amount);
    uint eth_amount = (token_amount * 1 ether) / tokensPerEth;
    payable(msg.sender).transfer(eth_amount);
    return true;
  }

}
