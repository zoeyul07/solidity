pragma solidity ^0.5.1;

contract MyContract6{
    //how can we send ether when we call function

    mapping(address => uint256) public balances;

    /*solidity requires explicitness 
    whenever you are declaring an address that can accept ehter 
    and set up smart contranct*/
    address payable wallet;

    //can get event stream for event
    event Purchase (address _buyer, uint256 _amount);

    constructor(address payable _wallet) public{
        wallet = _wallet;
    }

    //pubic can be called inside and outside
    //external can only be called  outside
    function() external payable {
        buyToken(); 
    }

    function buyToken() public payable {
        //simulate what happen
        //buy token and send ehter to the token
        balances[msg.sender] += 1;

        //mgs.value: sent value
        //transfer ether to wallet
        wallet.transfer(msg.value);

        //trigger event
        emit Purchase(msg.sender, 1);
    }
}