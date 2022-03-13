# Yo Kitties Contract
The smart contract for [Yo Kitties](https://yokitties.com), the 5k generative cat NFT collection collab between [smol farm](https://smol.farm) and [Iron Chef Cat Cora](https://www.catcora.com). The project launched at 8 PM eastern on March 12th, 2022.

The usage of ```unchecked {}``` blocks enables significant gas savings, particularly around the math performed in the checks in the minting function. This disables integer overflow protections, but we safely establish the quantity must be between 0 and 25 -- the non-negative bound provided by ```uint256``` being unsigned.

This contract makes use of ERC721A, much like our previous profile pic collection, [Dastardly Ducks](https://dastardlyducks.com), though we are now using v3.0.0 instead of v1.0.0, offering further improvements and refinements over what was available two months prior to this project.

## Notes

The comments on ```promoMint()``` says "ducks" instead of "kitties." This reflects an error present in the contract at deployment time, though, fortunately, does not affect functionality. 

## Yo Kitties
* [Website](https://yokitties.com)
* [Etherscan](https://etherscan.io/address/0xC303Ff7a410fB8cD27c203753088009630e2DDd4)
* [OpenSea](https://opensea.io/collection/yo-kitties)
* [Twitter](https://twitter.com/yokittiesnft)

## Author
Contract by Thorne aka existentialenso.eth

* [Twitter](https://twitter.com/existentialenso)
* [GitHub](https://github.com/existentialenso)
