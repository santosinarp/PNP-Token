pragma solidity 0.4.24;


import "./Ownable.sol";

contract Pausable is Ownable {
    event Pause();
    event Unpause();

  // set paused as true as the requirement
    bool public paused = true;
    
  //@dev Modifier to make a function callable only when the contract is not paused.
    modifier whenNotPaused() {
        require(!paused);
        _;
    }


  //@dev Modifier to make a function callable only when the contract is paused.
    modifier whenPaused() {
        require(paused);
        _;
    }


  //@dev called by the owner to pause, triggers stopped state
    function pause() onlyOwner whenNotPaused public {
        paused = true;
        emit Pause();
    }


  //@dev called by the owner to unpause, returns to normal state
    function unpause() onlyOwner whenPaused public {
        paused = false;
        emit Unpause();
    }
}
