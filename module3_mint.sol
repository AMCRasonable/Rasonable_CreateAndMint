// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract AnaToken is ERC20, Ownable {

    constructor() ERC20("AnaToken", "AT") {
        _mint(msg.sender, 1000 * 10**decimals());
    }

    // Function for minting tokens (owner)
    function mint_tokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Fucntion for burning tokens (any user)
    function burn_tokens(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Function for transfering tokens (any user)
    function transfer_tokens(address recipient, uint256 amount) public returns (bool) {
        return super.transfer(recipient, amount);
    }
}
