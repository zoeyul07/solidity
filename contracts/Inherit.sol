pragma solidity ^0.5.1;

contract ERC20Token {
    string public name;
    mapping (address => uint256) public balances;
     
    function mint() public {
        //calling contract function in another contract function passes mgs.sender as contract address not who sent initial transaction
        //if you use like this ERC20Token balances won't increase. use tx.origin
        //balances[msg.sender] ++;
        //tx.origin: alwalys the person who originated the transaction even if the smart contract is calling the function, 
        balances[tx.origin] ++;
    }
}

//to use ERC20Token contract, need to know ERC20Token contract address
contract MyContract{
    address payable wallet;
    address public token;

    constructor(address payable _wallet, address _token) public{
        wallet = _wallet;
        token = _token;
    }

    function() external payable {
        buyToken(); 
    }

    function buyToken() public payable {
       ERC20Token _token = ERC20Token(address(token));

       //calling contract function in another contract function passes mgs.sender as contract address not who sent initial transaction
       //if you use like this ERC20Token balances won't increase
       _token.mint();
        wallet.transfer(msg.value);
    }

    //referece contract with the address
}