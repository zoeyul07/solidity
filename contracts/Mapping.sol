pragma solidity ^0.6.0;

contract MyContract3 {
    uint256 public peopleCount;

    //mapping: associative array
    //uint는 key(unsigned integer로, id와 같은 역할을 하게된다.), person은 value를 나타내게된다.
    mapping(uint => Person) public people;
    mapping(uint => string) public names;
    mapping(address => mapping(uint => Book)) public myBooks;

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    } 

    struct Book {
        string title;
        string author;
    }

    constructor() public {
        names[1] = "Adam";
        names[2] = "Bruce";
        names[3] = "Carl";
    }

    function addPerson(string memory _firstName, string memory _lastName) public {
        peopleCount +=1;

        //reference people number 1
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    //internal: private funciton
    //not exposed outside of contract
    function increamentCount () internal{
        peopleCount += 1;
    }

    function addMyBook(uint _id, string memory _title, string memory  _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
}