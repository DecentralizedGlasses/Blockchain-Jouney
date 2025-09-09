//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "contracts/SolidityAgain/StorageFactory/SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage{
    // +5
    // overrides
    // virtual override
    //when overrding a function we need to write override in the one that is overriding
    // and "virtual" keyword in the one that is getting overrided
    function store(uint256 _newNumber) public override{
        myfavoriteNumber = _newNumber+5;
    }


}
