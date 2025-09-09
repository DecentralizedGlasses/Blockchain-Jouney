//SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {PriceConverter} from "./PriceConverter.sol";

error notOwner();

contract FundMe {

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18;// our output will be in 10 decimals so we need to multiply with 1e18
    // non-constant gas amounts gas	924574 gas
    //transaction cost	803977 gas 
    //execution cost	699957 gas 
    //execution cost	2491 gas (Cost only applies when called by a contract) for calling MINIMUM_USD
    //constant gas amounts gas	901159 gas
    //transaction cost	783616 gas 
    //execution cost	679652 gas 
    // execution cost	392 gas (Cost only applies when called by a contract) for calling MINIMUM_USD
    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmontFunded; 
    // mapping funder and amountFunded in an array
    mapping(address => uint256) public contributions;

    //uint256 public tinyTipAmount = 1e9;
    address public immutable owner;
    //non-immutable gas amounts
    // execution cost	2508 gas (Cost only applies when called by a contract)
    // with 'constant' keyword gas	901159 gas
    //transaction cost	783616 gas 
    //execution cost	679652 gas  
    //immutable gas amounts and with constant
    //gas	874512 gas
    //transaction cost	760445 gas 
    //execution cost	657149 gas 
    //execution cost	373 gas (Cost only applies when called by a contract)
    constructor (){
        owner = msg.sender;

    }

    function fund() public payable {
        //Allow users to send $
        // Have a minimum USD to sent
        // 1. how do we send eth to this contract
        //msg.value.getConversionRate();// the variable that delcared in getConversionRate() will be passed in msg.value()
        // if there is one more parameter in that function that would be passed inside the parenthesis and msg.value is still initial parameter
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Spend more ETH"); // for 1ETH there are 10 ** 18 wei, we talk only about wei in smart contracts
        funders.push(msg.sender);
        addressToAmontFunded[msg.sender] = addressToAmontFunded[msg.sender] + msg.value;

    } 
    // function tinyTip() public payable{
    //     require(msg.value < tinyTipAmount,"it is greater than 1Gwei" );
    // }
//     function tinyTip() public payable {
//     require(msg.value < 100 wei, "Tip must be less than 1 gwei");
// }


    function contributonCount(address user) public view  returns (uint256){
        return contributions[user];
    }

    function withdraw() public onlyOwner {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){ // synttax for a 'for' loop in solidity
            address funder = funders[funderIndex]; // to get the address of the funder
            addressToAmontFunded[funder] = 0; // making the amount funded to zero that happens when the array we need to withdraw funds
        }
        //resetting an array
        funders = new address[](0); // resetting the array array is listed we are resetting it 

        //three ways of sending ether from a contracr
        //transfer: simple, service and makes sense to use
        //consumes 2300 gas
        //payable(msg.sender).transfer(address(this).balance);
        //send:consumes 2300 gas and returns in bool expression
        //bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //require(sendSuccess, "send Failed");
        //call: most advanced to use it can call any function in the ether
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}(""); //inside parentesis we are calling the function currently not calling
        require(callSuccess, "call Failed");

    }

    modifier onlyOwner(){

        //require(msg.sender == owner, "you're not owner");
        if(msg.sender != owner){revert notOwner();}
        //the above code is the equivalent to the line below but it is more gas efficient and it does the same job
        _; //this is the underscore it is the equivalent to the code that will be executed in the function that is calling the modifier
        //if the underscore is above the condition if will first compile the function and them comes to modifier

    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
     }

    
}


