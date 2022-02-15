pragma solidity ^0.5.1;

//find functions or store variables ...etc
//dont' have full behavior of smart contract, don't have storages, can not inherit
//meant to be used in smart contract
//safer way to do division inside of solidity
//preventing error (e.g if b is 0, can not divide) 

library Math {
    function divide(uint256 a, uint256 b) internal pure returns (uint256) {
        require( b > 0);
        uint256 c = a / b;
        
        return c;
    }
}
