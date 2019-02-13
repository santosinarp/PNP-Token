pragma solidity 0.4.24;

import "./ERC20.sol";
import "./BasicToken.sol";

contract StandardToken is ERC20, BasicToken {
    mapping (address => mapping (address => uint256)) internal allowed;

    // implementation transfer from another user
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_value > 0);
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }

    // implementation approval to allowed transfer
    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_value > 0);
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // check total allowance particular user
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    }

  // implementation increase total approval from particular user
    function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
        require(_addedValue > 0);
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    // implementation decrease total approval from particular user
    function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
        require(_subtractedValue > 0);
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
        }
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

}
