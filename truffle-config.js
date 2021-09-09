module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    // matic: { // @ref https://docs.matic.network/docs/develop/truffle/
    //   provider: () => new HDWalletProvider(mnemonic, `https://rpc-mumbai.maticvigil.com`),
    //   network_id: 80001,
    //   confirmations: 1,
    //   timeoutBlocks: 200,
    //   skipDryRun: true
    // },

    // @ref https://forum.openzeppelin.com/t/connecting-to-public-test-networks-with-truffle/2960
    // Useful for deploying to a public network.
    // NB: It's important to wrap the provider as a function.
    // ropsten: {
    //   provider: () => new HDWalletProvider(mnemonic, `https://ropsten.infura.io/v3/${projectId}`),
    //   network_id: 3,       // Ropsten's id
    //   gas: 5500000,        // Ropsten has a lower block limit than mainnet
    //   confirmations: 2,    // # of confs to wait between deployments. (default: 0)
    //   timeoutBlocks: 200,  // # of blocks before a deployment times out  (minimum/default: 50)
    //   skipDryRun: true     // Skip dry run before migrations? (default: false for public nets )
    // },

    hireizi: {
      host: "hireizi.com",
      port: 8545,
      network_id: "1631178929179",
    },

    develop: {
      port: 8545
    }
  }
};
