
pragma solidity ^0.4.24;

contract Certification {
    constructor() public {}

    struct Certificate {
        string date;
        string time;
        string pName;
        string place;
        string addr;
    }

    mapping(bytes32 => Certificate) public certificates;

    string combi;
    bytes32 hash;

function strConcat(string memory _a, string memory _b) public pure returns (string memory){
    bytes memory _ba = bytes(_a);
    bytes memory _bb = bytes(_b);

    string memory abcde = new string(_ba.length + _bb.length);
    bytes memory babcde = bytes(abcde);
    uint k = 0;
    for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
    for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
    return string(babcde);
}

    function personID() public view returns(bytes32) {
        return hash;
    }

    function generateCertificate(string memory _date, string memory _time, string memory _pName, string memory _pBirth, string memory addr) public returns(bytes32){
        
        bytes32 hash_id = sha256(abi.encodePacked(strConcat(_date, _pName))); 
        hash = hash_id;
        certificates[hash_id] = Certificate( _date, _time, _pName, _pBirth, addr);
    }
    
    function getData(bytes32 _id) public view returns(string memory, string memory, string memory, string memory, string memory) {

        Certificate memory temp = certificates[_id];

        return (temp.date, temp.time, temp.pName, temp.place, temp.addr);
    }
    
}