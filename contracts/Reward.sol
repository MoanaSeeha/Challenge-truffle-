// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.0;

contract RewardToken is ERC20, ERC20Burnable, Ownable {

    address public mintableAddress;

    constructor() ERC20("TVPunks", "TVP") {
    }

    function mint(address to, uint256 amount) public {
        require((msg.sender == owner() || msg.sender == mintableAddress), "You cannot mint token");
        _mint(to, amount);
    }

    function setMintableAddress(address _mintableAddress) public onlyOwner {
        mintableAddress = _mintableAddress;
    }
}