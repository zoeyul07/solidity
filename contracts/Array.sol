pragma solidity ^0.6.0;

contract MyContract2 {
    //Person list data type을 갖고있다.
    // solidity는 array의 size를 모르기 때문에 전체 array를 return하지 않는다.
    // 그렇기 때문에 person 을 id로 reference 해줘야한다. ( array의 index와 같은 의미 )
    Person [] public people;

    uint256 public peopleCount;

    //struct: define your own data structures inside solidity
    struct Person {
        string _firstName;
        string _lastName;
    }

    function addPerson(string memory _firstName, string memory _lastName) public {
        people.push(Person(_firstName, _lastName));
        peopleCount +=1;
    }

    function valueCount() public view returns (uint){
        return people.length;
    }

}



