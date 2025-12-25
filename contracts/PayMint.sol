// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PayMint is ERC721Enumerable, Ownable {
    uint256 public constant PRICE = 0.001 ether;
    uint256 public immutable maxSupply;
    uint256 private _tokenIdCounter;

    string private _baseTokenURI;

    event NFTClaimed(address indexed user, uint256 tokenId);

    constructor(
        uint256 maxSupply_,
        string memory baseURI_
    )
        ERC721("PayMint NFT", "PMNFT")
        Ownable(msg.sender)   // ✅ REQUIRED in OZ v5
    {
        maxSupply = maxSupply_;
        _baseTokenURI = baseURI_;
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }

    function mintToContract(uint256 amount) external onlyOwner {
        require(totalSupply() + amount <= maxSupply, "Max supply reached");

        for (uint256 i = 0; i < amount; i++) {
            _mint(address(this), _tokenIdCounter);
            _tokenIdCounter++;
        }
    }

    function payAndClaim() external payable {
        require(msg.value == PRICE, "Incorrect ETH amount");
        require(balanceOf(address(this)) > 0, "Sold out");

        uint256 tokenId = tokenOfOwnerByIndex(address(this), 0);
        _safeTransfer(address(this), msg.sender, tokenId, "");

        emit NFTClaimed(msg.sender, tokenId);
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
