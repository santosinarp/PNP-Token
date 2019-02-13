pragma solidity 0.4.24;

import "./ERC20Basic.sol";
import "./SafeMath.sol";

contract BasicToken is ERC20Basic {
    using SafeMath for uint256;

    mapping(address => uint256) balances;

    // implementation of transfer token
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_value > 0);
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // check balance user (map)
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

}
