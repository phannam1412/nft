# Heroes and Dragon

figma: https://www.figma.com/file/Zg5FdgLjbvhvqubDU4a5kc/Heroes-vs-Dragon-Card-Game-Community?node-id=147%3A11

# QUICKSTART

Setup front-end 

```
npm install
npm run dev
```

Fresh build for smart contract

```
rm -rf build && truffle compile && truffle migrate
```

# CÁCH CHƠI

- người dùng chọn 1 trong 4 loại quân: healer, knight, hammer, mage
  đối với mỗi loại quân được chọn, sẽ có 3 action: attack, depend, special
- người dùng chọn 1 trong 4 con rồng để đánh, tỷ lệ thắng lần lượt là: 20, 40, 60, 80
- người dùng chọn action: attack, depend, special
- hệ thống hiển thị kết quả
