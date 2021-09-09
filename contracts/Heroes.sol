pragma solidity ^0.5.16;

contract Heroes {

    mapping(address => uint256) private _balances;

    event AttackResult(address indexed from, bool result, uint reward);

    // @reff https://betterprogramming.pub/how-to-generate-truly-random-numbers-in-solidity-and-blockchain-9ced6472dbdf
    function random() private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, now)));
    }

    // xem số dư của tài khoản này
    function balanceOf() public view returns (uint256) {
        return _balances[msg.sender];
    }

    // đút thêm tiền cho tài khoản
    function mint(address account, uint256 amount) public {
        _balances[account] += amount;
    }

    // đánh nhau với rồng
    function attack(uint heroType, uint dragonType) public {

        require(heroType >= 0 && heroType <= 3); // hỗ trợ 4 loại siêu anh hùng: healer, knight, hammer, mage
        require(dragonType >= 0 && dragonType <= 4); // hỗ trợ 4 loại rồng, tỷ lệ thắng lần lượt là: 20%, 40%, 60%, 80%

        uint rand = random() % 100;

        bool result;
        result = true;
        uint reward;
        // trả về kết quả tuỳ theo tỷ lệ thắng
        if (dragonType == 0 && rand <= 50) { // đáng lẽ là 20% nhưng cho 50% để test
             reward += 50;
        }
        else if (dragonType == 1 && rand <= 40) {
            reward += 60;
        }
        else if (dragonType == 2 && rand <= 60) {
            reward += 40;
        }
        else if (dragonType == 3 && rand <= 80) {
            reward += 20;
        } else {
            result = false;
        }
        _balances[msg.sender] += reward;

        emit AttackResult(msg.sender, result, reward);
    }

    function depend(uint heroType, uint dragonType) public {
        attack(heroType, dragonType);
    }

    function special(uint heroType, uint dragonType) public  {
        attack(heroType, dragonType);
    }
}