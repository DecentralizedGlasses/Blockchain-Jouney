//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "contracts/SolidityAgain/StorageFactory/SimpleStorage.sol";  // this is normal import we're importing the whole solidity file
// import {SimpleStorage} from "./contracts/SolidityAgain/StorageFactory/SimpleStorage.sol"; //this is advanced type of import
//in the above import we're jsut importing specific contract and also we can add as many contracts we need
// this advanced type of importing will save a lot of time an headaches

contract StorageFactory{

    //uint256 public favoriteNumber
    //type    Visibility  name
    //the above two are the way that we declare a variable in solidity

    SimpleStorage public simpleStorage; //SimpleStorage is contract and simpleStorage is variable
    SimpleStorage[] public listOfSimpleStorageContracts;//we created an array to track all the smart contract addresses that are being generated


    function createSimpleStorageContract() public{
         simpleStorage = new SimpleStorage(); //this "new" keyword that solidity knows to deploy a contract
         // in the above line we're assigning the smart contract SimpleStorage to the variable simple storage.
         // that is the reason why we declared simpleStorage as that type varibale means here the type of variable is a smart contract
         SimpleStorage newSimpleStorageContract = new SimpleStorage();
         listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        //Address
        //ABI- Application Binary Interface
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
        //in the above lines we're creating a index and values places to store them in the contract 
    }
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage =   listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();  
        //this is retrieving function to retreive the number in the respected index that we entered
    }

}
