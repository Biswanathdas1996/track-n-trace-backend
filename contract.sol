// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    uint[] public nftTokenList;
    Counters.Counter private _tokenIds;
   
    constructor() ERC721("Token", "TOKEN") {}

    function create()
        public
        returns (uint256)
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        nftTokenList.push(newItemId);
        return newItemId;
    }
    
    function addData(uint newItemId, string memory tokenURI) public returns (uint256){
         _setTokenURI(newItemId, tokenURI);
         return newItemId;
    }

    function getToken() public view returns (uint[] memory) {
        return  nftTokenList;
    }

  
  
}