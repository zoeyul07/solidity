// 어떤 버전을 사용할건지
pragma solidity ^0.6.0;

contract MyContract{
    // statically typed language이기 때문에 타입을 지정해줘야한다.
    // 이 variable은 contract에 속한 것으로 function 안에서 선언하는 lcoal variable 과는 다르게 blockchain 에 store 된다.
    string value;

    // contructor를 사용하지 않고 다음과 같이 바로 사용할 수 있다.
    // string public value = "myValue";
    
    bool public myBool = true;
    bytes32 public myByte43 = "hello world";
    //int는 negative 가 가능하지만 unint는 불가능하다.
    int public myInt = -1;
    // default는 256
    uint public myUint = 1;
    uint8 public myUint8 = 8;
    uint256 public myUint256 = 99999;

    //every user that has an connection with blockchanin has an addres, every contract on the blockchain has an address
    //address public myAddress = 0x5Ab54....;
    
    // enumerated list, allow us to keep track of set list of things in contract
    // Waiting =0, Ready = 1, Active = 2
    enum State { Waiting, Ready, Active }
    State public state;


    // constant keyword를 이용하면 아래에서와 같이 set으로 값을 변경할 수 없게 지정할 수 있다.
    // string public constant value = "myValue";

    // deploy 혹은 generate 될 때 value 값 지정
    constructor() public {
        value = "myValue";
        state = State.Waiting;
    }

    // public keyword를 사용하면 blockchiain 상의 이 contract에 접근할 수 있는 사람이라면 누구나 사용할 수 있다
    // data location must be "memory" for return parameter in function
    // string public value; 와 같이 public keyword를 이용해서 상단에서 선언하게 되면 get() function 없이도 value에 접근할 수 있다.
    // value값을 바꾸지 않고 그대로 return 하므로 view를 사용한다. (views value, not change value)
    function get() public view returns(string memory){
        return value;
    }

    function set(string memory _value) public {
        value = _value;
    }

    function activate() public {
        //sate가 Wating이면 0. Ready면 1, Active이면 2
        state = State.Active;
    }

    function isActive() public view returns(bool) {
        return state == State.Active;
    }
    
 }