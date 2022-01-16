//SPDS-License-Identifier: MIT

pragma solidity 0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//inherit all the functions from the erc721 token standard.
contract SimpleCollectible is ERC721 {
    uint256 public tokenCounter;

    constructor() public ERC721("Dogie", "DOG") {
        tokenCounter = 0;
    }

    function createCollectible(string memory tokenURI)
        public
        returns (uint256)
    {
        //We will iterate this everytime we mint a new token
        uint256 newTokenId = tokenCounter;
        //Give this new nft an owner and the unique token id
        _safeMint(msg.sender, newTokenId);
        //this will allow our nft to be associated with an image that we can actually see.
        _setTokenURI(newTokenId, tokenURI);
        tokenCounter += 1;
        return newTokenId;
    }
}
