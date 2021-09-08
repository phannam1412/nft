pragma solidity ^0.5.0;
contract Heroes {

    function attack(uint heroType, uint dragonType) public returns (bool) {

        require(heroType >= 0 && heroType <= 3); // hỗ trợ 4 loại siêu anh hùng: healer, knight, hammer, mage
        require(dragonType >= 0 && dragonType <= 4); // hỗ trợ 4 loại rồng, tỷ lệ thắng lần lượt là: 20%, 40%, 60%, 80%

        uint rand = uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp))) % 100;

        // trả về kết quả tuỳ theo tỷ lệ thắng
        if (dragonType == 0 && rand <= 20) {
            return true;
        }
        if (dragonType == 1 && rand <= 40) {
            return true;
        }
        if (dragonType == 2 && rand <= 60) {
            return true;
        }
        if (dragonType == 3 && rand <= 80) {
            return true;
        }

        return false;
    }

    function depend(uint heroType, uint dragonType) public returns (bool) {
        return attack(heroType, dragonType);
    }

    function special(uint heroType, uint dragonType) public returns (bool) {
        return attack(heroType, dragonType);
    }
}