pragma solidity ^0.6.0;

contract HotelRoom {
    enum Status { Vacant, Occupied }

    Status currentStatus;
    address payable public owner;

    event Occupy(address _occupant, uint _value);

    constructor () public {
        //user who calls this function
        owner = msg.sender;
        currentStatus = Status.Vacant;
    }

    modifier onlyWhileVacant {
         require(currentStatus == Status.Vacant, "Currently occupied");
         _;
    }

    modifier costs (uint _amount) {
        require( msg.value >= _amount, "Not enough Ether provided");
        _;
    }

    /*receive(): will be triggered whenever you pay to this smart contract.
     send ehter to the address, then this function will be called*/
    receive() external payable onlyWhileVacant costs(2 ether) {
        currentStatus = Status.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
}