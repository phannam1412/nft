pragma solidity ^0.5.16;

contract Heroes {

    mapping(address => uint256) private _balances;

    // xem số dư của tài khoản này
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    // đút thêm tiền cho tài khoản
    function mint(address account, uint256 amount) public {
        _balances[account] += amount;
    }

    // đánh nhau với rồng 
    function attack(uint heroType, uint dragonType) public {

        require(heroType >= 0 && heroType <= 3); // hỗ trợ 4 loại siêu anh hùng: healer, knight, hammer, mage
        require(dragonType >= 0 && dragonType <= 4); // hỗ trợ 4 loại rồng, tỷ lệ thắng lần lượt là: 20%, 40%, 60%, 80%

        uint rand = uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp))) % 100;

        // trả về kết quả tuỳ theo tỷ lệ thắng
        if (dragonType == 0 && rand <= 20) {
            _balances[msg.sender] += 80;
        }
        else if (dragonType == 1 && rand <= 40) {
            _balances[msg.sender] += 60;
        }
        else if (dragonType == 2 && rand <= 60) {
            _balances[msg.sender] += 40;
        }
        else if (dragonType == 3 && rand <= 80) {
            _balances[msg.sender] += 20;
        } else {
            _balances[msg.sender] -= 5;
        }
    }

    function depend(uint heroType, uint dragonType) public {
        attack(heroType, dragonType);
    }

    function special(uint heroType, uint dragonType) public  {
        attack(heroType, dragonType);
    }
}