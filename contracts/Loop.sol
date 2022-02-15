pragma solidity ^0.6.0;

/*the keyword view is introduced for functions (it replaces constant). 
Calling a view cannot alter the behaviour of future interactions with any contract. 
This means such functions cannot use STORE, cannot send or receive ether 
and can only call other view or pure functions.*/

/*the keyword pure is introduced for functions,
they are view functions with the additional restriction 
that their value only depends on the function arguments. 
This means they cannot use STORE, LOAD, cannot send or receive ether, 
cannot use msg or block and can only call other pure functions*/

contract Loop {
    uint[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function countEvenNumbers() public view returns (uint){
        uint count = 0;

        for(uint i = 0; i < numbers.length; i++) {
            if(isEvenNumber(numbers[i])){
                count ++;
            }
        }
        return count;
    }

    /*With view you cannot modify the contract storage, 
    but you can access the storage. 
    With pure you cannot access the contract storage. 
    For example contract getters are views, 
    and utility libraries that do not access conctract storage 
    but only its parameters can be declared as pure.*/
    function isEvenNumber(uint _number) public pure returns(bool) {
        //5 / 2 == 2 R1
        //4 / 2 == 2 R0
        if ( _number % 2 == 0 ) {
            return true;
        } else {
            return false;
        }
    }

    function isOwner() public view returns(bool) {
        return (msg.sender == owner);
    }
}
