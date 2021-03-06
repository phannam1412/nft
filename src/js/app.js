App = {
    web3Provider: null,
    contracts: {},
    selectedHero: 0, // người dùng chọn hero
    selectedDragon: 0, // người dùng chọn rồng

    init: async function () {
        return await App.initWeb3();
    },

    // khởi tạo web3 tương ứng với từng provider
    initWeb3: async function () {
        if (window.ethereum) {
            App.web3Provider = window.ethereum;
            try {
                await window.ethereum.enable();
            } catch (error) {
                console.error("User denied account access")
            }
        }
        else if (window.web3) {
            App.web3Provider = window.web3.currentProvider;
        }
        else {
            App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
        }
        web3 = new Web3(App.web3Provider);
        return App.initContract();
    },

    // load contract definition từ json đã được compile bằng `truffle compile`
    initContract: function () {
        $.getJSON('Heroes.json', function (data) {
            var HeroesArtifact = data;
            App.contracts.Heroes = TruffleContract(HeroesArtifact);
            App.contracts.Heroes.setProvider(App.web3Provider);
        });
        return App.bindEvents();
    },

    bindEvents: function () {
        $(document).on('click', '.btn-attack', App.handleAttack);
        $(document).on('click', '.btn-depend', App.handleDepend);
        $(document).on('click', '.btn-special', App.handleSpecial);
        $(document).on('click', '.btn-view', App.handleView);
    },

    // hàm tấn công rồng, call smart contract ở đây
    handleAttack: function (event) {
        event.preventDefault();
        var heroesInstance;
        web3.eth.getAccounts(function (error, accounts) {
            if (error) {
                console.log(error);
            }
            var account = accounts[0];
            App.contracts.Heroes.deployed().then(function (instance) {
                heroesInstance = instance;
                return heroesInstance.attack(App.selectedHero, App.selectedDragon, {from: account});
            }).then(function (result) {
                console.log(result);
                result.logs.forEach(function(item){
                    if(item.event != 'AttackResult')
                        return;
                    if(item.args.result) {
                        alert("bạn đã thắng, số tiền kiếm được thêm là: " + item.args.reward);
                        return;
                    }
                    alert("bạn đã thua");
                })
            }).catch(function (err) {
                alert(err.message);
            });
        });
    },

    // hàm view số tiền trong tài khoản
    handleView: function (event) {
        event.preventDefault();
        web3.eth.getAccounts(function (error, accounts) {
            if (error) {
                console.log(error);
            }
            var account = accounts[0];
            App.contracts.Heroes.deployed().then(function (instance) {
                return instance.balanceOf(account,{from: account});
            }).then(function (result) {
                alert("số dư hiện có của bạn: " + result);
            }).catch(function (err) {
                alert(err.message);
            });
        });
    },
    handleDepend: function(event) {
        App.handleAttack(event);
    },
    handleSpecial: function(event) {
        App.handleAttack(event);
    },

};

$(function () {
    $(window).load(function () {
        App.init();
    });
});
