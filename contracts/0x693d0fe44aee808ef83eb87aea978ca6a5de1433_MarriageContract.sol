pragma solidity ^0.4.21;

contract MarriageContract {

    address a;
    address b;
    uint256 till;
    string agreement;

    mapping(address =&gt; bool) coupleConfirmations;
    mapping(address =&gt; bool) witnesses;

    modifier onlyCouple(){
        require(msg.sender == a || msg.sender == b);
        _;
    }

    function MarriageContract(address _a, address _b, uint256 _till, string _agreement){
        a = _a;
        b = _b;
        till = _till;
        agreement = _agreement;
    }

    function getA() constant returns (address) {
        return a;
    }

    function getB() constant returns (address) {
        return b;
    }

    function getTill() constant returns (uint256){
        return till;
    }

    function getAgreement() constant returns (string) {
        return agreement;
    }

    function married() constant returns (bool) {
        return coupleConfirmations[a] &amp;&amp; coupleConfirmations[b] &amp;&amp; till &gt;= now;
    }

    function signContract() onlyCouple() {
        coupleConfirmations[msg.sender] = true;
    }

    function signWitness(){
        witnesses[msg.sender] = true;
    }

    function isWitness(address _address) constant returns (bool) {
        return witnesses[_address];
    }

}