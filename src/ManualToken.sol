// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract ManualToken {
    mapping(address => uint256) private s_balances;

    // function name() public pure returns (string memory) {
    //     return "ManualToken";
    // }

    string public constant name = "ManualToken";

    function totalSupply() public pure returns (uint256) {
        return 1000 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address tokenOwner) public view returns (uint256 balance) {
        return s_balances[tokenOwner];
    }

    function transfer(address _to, uint256 _amount) public {
        uint previousBalance = s_balances[_to] + balanceOf(msg.sender);
        require(s_balances[msg.sender] >= _amount, "Insufficient balance");
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        require(s_balances[_to] + balanceOf(msg.sender) == previousBalance, "Transfer failed");
    }
}
