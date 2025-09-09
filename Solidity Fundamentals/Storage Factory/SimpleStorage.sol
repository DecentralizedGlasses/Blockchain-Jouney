// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;   // Stated Version

contract SimpleStorage{

    uint myfavoriteNumber;

    struct Person {
        string name;
        uint256 favoriteNumber;
        string gender;
    }
    //dynamic array
    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber; //mapping string with number, example: siv=>3


    //function to display favortie number 
    function store(uint _favoriteNumber) public virtual{
        myfavoriteNumber = _favoriteNumber;
    }
    //function to retrieve favortie number
    function retrieve() public view returns(uint256){
        return myfavoriteNumber;
    }
    // creating an dynamic way to add people to the list
    function addPerson(string memory _name, uint256 __favoriteNumber, string memory _gender) public {
        
        listOfPeople.push(Person(_name, __favoriteNumber, _gender));
        nameToFavoriteNumber[_name] = __favoriteNumber; // using mapping function here
    }
}
