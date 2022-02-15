pragma solidity ^0.5.1;

import "./Math.sol";
//import "./SafeMath.sol";

contract MyContract {
    //외부 라이브러리 사용시
    //using SafeMath for uint256
    uint256 public value;

    function calculate(uint _value1, uint _value2) public {
        //value = _value1.div(_value2)
        //if you deploy contract, library will be deployed automatically.
        value = Math.divide(_value1, _value2);
    }
}

// import "./SafeMath.sol";

// contract MyContract {
//     using SafeMath for uint256;

//     function calculate(uint _value1, uint _value2) public {
//         value = _value1.div(_value2);
//     }
// }