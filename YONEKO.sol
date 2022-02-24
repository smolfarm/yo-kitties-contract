/*
* YO KITTIES smart contract
* TODO put cool ASCII art here
*/
pragma solidity ^0.8.0;

import "./ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract YONEKO is ERC721A, Ownable, Pausable {
    uint256 public mintPrice = 0.02 ether;
    uint256 public constant maxTokens = 5000;

    string public constant baseURI = "ipfs://FINAL_IPFS_URL_HERE/";

    constructor() ERC721A("Yo Kitties", "YONEKO", 100) {
        _pause();
    }

    function mintCat(uint256 qty) public payable whenNotPaused {
        require(qty <= 100, 'MAX_BATCH_EXCEEDED');
        require(mintPrice * qty <= msg.value, 'LOW_ETHER');
        unchecked { require(totalSupply() + qty <= maxTokens, 'MAX_REACHED'); }
        _safeMint(msg.sender, 1);
    }

    // Mint the first 60 kitties to the smol farm wallet for promotional purposes
    function promoMint() public onlyOwner {
        unchecked { require(totalSupply() == 0, 'PROMO_ALREADY_RUN'); }
        _unpause();

        _safeMint(0xafE9c4e5585334D545A9CF43Aa9415a11AC3D7b3, 60);
    }

    function setPrice(uint256 newPrice) public onlyOwner {
        mintPrice = newPrice;
    }

    function withdraw() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function _baseURI() internal pure override returns (string memory) {
        return baseURI;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }
}