
pragma solidity^0.5.16;

contract BlockCert {
    bytes32 hash;
    
    struct certificate {
        string organisation;
        string name;
        string course;
        string score;
        string date;
        string roll_no;
    }
    
    mapping(bytes32 => certificate) public certificates;
    
    function strConcat(
        string memory _roll_no, 
        string memory _date
        ) public pure returns (string memory){
        
        bytes memory roll_no = bytes(_roll_no);
        bytes memory date = bytes(_date);
    
        string memory combine = new string(roll_no.length + date.length);
        bytes memory babcde = bytes(combine);
        uint k = 0;
        for (uint i = 0; i < roll_no.length; i++) babcde[k++] = roll_no[i];
        for (uint i = 0; i < date.length; i++) babcde[k++] = date[i];
        return string(babcde);
    }
    
    function generateCertificate(
        string memory _organisation, 
        string memory _name, 
        string memory _course, 
        string memory _score, 
        string memory _date, 
        string memory _roll_no
        ) public returns(bytes32){
        
        bytes32 hash_id = sha256(abi.encodePacked(strConcat(_roll_no, _date))); 
        hash = hash_id;
        certificates[hash_id] = certificate( _organisation, _name, _course, _score, _date, _roll_no );
        return hash_id;
    }
    
    function personID() public view returns(bytes32) {
        return hash;
    }
    
    function getData(
        bytes32 _id
        ) public view returns(string memory, string memory, string memory, string memory, string memory, string memory) {

        certificate memory temp = certificates[_id];

        return (temp.organisation, temp.name, temp.course, temp.score, temp.date, temp.roll_no);
    }
    
}
