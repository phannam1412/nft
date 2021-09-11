var Heroes = artifacts.require("Heroes");
module.exports = function(deployer) {
    deployer.deploy(Heroes, 1000000);
}