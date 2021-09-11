pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// @ref https://forum.openzeppelin.com/t/deploy-contracts-to-a-public-network/1653
contract Heroes is ERC20 {

    event AttackResult(address indexed from, bool result, uint reward);

    constructor(uint256 initialSupply) ERC20("Nam", "NAM") {
        _mint(msg.sender, 1000000);
    }

    // tạm thời để test nên decimals = 0
    function decimals() public view virtual override returns (uint8) {
        return 0;
    }

    // @ref https://betterprogramming.pub/how-to-generate-truly-random-numbers-in-solidity-and-blockchain-9ced6472dbdf
    function random() internal view returns(uint){
        return uint(blockhash(block.number - 1));
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
        if(reward > 0) {
            _mint(msg.sender, reward);
        }
        emit AttackResult(msg.sender, result, reward);
    }

    function depend(uint heroType, uint dragonType) public {
        attack(heroType, dragonType);
    }

    function special(uint heroType, uint dragonType) public  {
        attack(heroType, dragonType);
    }
}