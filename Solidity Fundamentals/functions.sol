//SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

// delcaring name of smart contract
contract simpleStorage {
    // the variable is bydeafult zero if we didn't assigned anything
    uint256 public myFavoriteNumber; // 0

    struct Person{
        uint256 favoriteNumber;
        string name;
    }
    // we created an array of people to add entries
    Person[] public listOfPeople;

    // mapping is like a hash table in javascript or dictionary in python
    //here we are creating mappings for string value and uint256 value
    // meand when we search for a string value it'll give the related uint256 value
    mapping (string => uint256) public nameToFavoriteNumber;
    // mapping (uint256 => string) public favoriteNumberToName;



    // below is one of the way to add number of entries to our list, but the problem is we need to add them everytime in every line:
    // a difficult thing to do
    // Person public siv = Person({favoriteNumber: 2, name : "siv"});
    // Person public ram = Person({favoriteNumber: 3, name : "Ram"});

    // declaring a function called "store" in the parenthesis we are adding the parameters which we are going to use in the entire function
    // public means anyone can call this function
    // _favoriteNumber is different from favortieNumber because
    function store(uint256 _myFavoriteNumber) public {
        myFavoriteNumber = _myFavoriteNumber;
    }
    // declaring a function called "retrieve" which will return the value of favortieNumber
    // "view" is used to just get the data from that function, it doesn't cost us anything
    function retrieve()  public view returns(uint256){
        return myFavoriteNumber;
    }


    //calldata, memory, storage
    // calldata: is given for unmodifiable temporary string
    // memory: is given for modifiable temporary string
    // storage: is for permanent variable that can be modified
    // and there are lot of this type of keywords we can learn about them later
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // the below two lines is one of the way we can add a person
        // Person memory newPerson = Person({favoriteNumber: _favoriteNumber, name: _name});
        // listOfPeople.push(newPerson);
        // in the below line of code solidity is smart enough to execute "Person(_favortieNumber, _name) first and then prevoius code later
        listOfPeople.push( Person(_favoriteNumber,_name));

        // we are adding mappings related line of code
        nameToFavoriteNumber[_name] = _favoriteNumber;   
        // the below line is one of way to represent the above 
        // favoriteNumberToName[_favoriteNumber] = _name;   
    }
}
