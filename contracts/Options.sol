// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";
//import "hardhat/console.sol";

contract Options is Ownable {

    address public constant WETH_RINKEBY = 0xc778417E063141139Fce010982780140Aa0cD5Ab;

 struct OptionsStruct {
        string kind;
        address erc20Address;
        uint premium;
        uint maturity;
        address nftAddress; 
    }

// also serves as options key
    uint public optionsCounter = 0; 

    // Declare a set state variable
    mapping(uint => OptionsStruct) public optionsMap;

    function dummy(address nft_address) public {
        // ToDo - require nft owner
        optionsCounter += 1;
        OptionsStruct memory oi = OptionsStruct(
            {kind: "call", erc20Address: address(WETH_RINKEBY), premium: 100,
            maturity: 100, nftAddress: nft_address});
        optionsMap[optionsCounter] = oi;
    }


    // ToDo
    // retrieve listings from smart contracts to display lists
    function createOfferCallOption() public {
        // ToDo - Create call terms and store them inside contract

        // buyer == borrower of loan
        //  buyer receives L and pays premium and puts NFT in escrow
        // seller == lender of loan
        //  seller pays P, receives premium, receives right to NFT
        /*
    - When the option expires (after the set duration) either
        - The buyer repays L ****in order to receive the NFT back (which is only rational if the price of that NFT is higher than L)
        - Or the buyer keeps L and is fine that the NFT stays with the seller (who will receive the NFT by promissory note)
    }
    */
    }
    function createOfferPutOption() public {
        /* 
        - At origination p0 **the seller receives** the premium **p and** the loan amount **L** and puts the NFT into the promissory note, conversely t**he buyer provides L** and the premium p to receive the right upon that note
- When the option expires (after the set duration) either
    - The buyer hands back the NFT and receives L in return (which is only rational if the price of the NFT is below L)
    - Or the buyer keeps the NFT and is fine to have paid L (+p) for it
- Despite the seller of the option being the one that ???borrows against the NFT???, it is still the buyer here, who serves as oracle, i.e. deciding if they keep the NFT or not. This functionality is currently the opposite of the one on NFTfi and you would therefore need to write a wrapper contract, that reverses that relationship.
- Hence, the buyers/sellers of call options are similar to lender/borrowers of a loan (so conversely to put options)
        */
    }
}
