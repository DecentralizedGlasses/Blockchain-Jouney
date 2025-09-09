//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract simpleStorage {
    //testing basic variable types
    // the value gets initialized to zero if nothing gets assigned
    uint256 favoriteNumber = 88; // any number unsigned
    bool hasFavoriteNumber = true; // only boolean values either true or false
    int256 signedFavoriteNumber = -99; // any number signed
    address favoriteAddress = 0x70f33E33C1108844Cd0315865c6d4Cc38dF027f3; //like a wallet address
    bytes32 favoriteBytes32 = "cat"; // like a string but can only be 32 bytes long
    string favoriteNumberToText = "eighty-eight"; //like a string but can be any length
}
