pragma solidity ^0.6.0;

contract MyContract4{
    uint256 public peopleCount;
    mapping(uint => Person) public people;

    address owner;

    modifier onlyOwner() {
        //mgs: global keyword, function meta data passed in
        //mgs.sender: tells us account, address who calls the function

        //require: triggers error and revert trasaction if false( no gas fee )
        require(msg.sender == owner);   
        _; 
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    constructor() public {
        //msg.sender is account that deploys the smart contract
        owner = msg.sender;
    }
    //modifier, only the owner can call function(any other count is impossible)
    function addPerson(string memory _firstName, string memory _lastName) public onlyOwner {
        increamentCount();

        //reference people number 1
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    //internal: private funciton
    //not exposed outside of contract
    function increamentCount () internal{
        peopleCount += 1;
    }

}


pragma solidity ^0.6.0;

contract MyContract5{
    uint256 public peopleCount;
    mapping(uint => Person) public people;

    //time is expressed in second in solidity
    uint256 openingTime = 1642668800;

    modifier onlyWhileOpen() {
        //to get now, get current block timestamp
        require(block.timestamp >= openingTime);   
        _; 
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    //only call function if time has passed
    function addPerson(string memory _firstName, string memory _lastName) public onlyWhileOpen {
        increamentCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function increamentCount() internal{
        peopleCount += 1;
    }

}