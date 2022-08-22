require("@nomicfoundation/hardhat-toolbox");
require('hardhat-deploy');

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  namedAccounts: {
    deployer: 0,
  },
  external: {
    contracts: [
      {
        artifacts: "https://github.com/NFTfi-Genesis/nftfi.eth/tree/main/V2/contracts",
        deploy: "https://github.com/NFTfi-Genesis/nftfi.eth/tree/main/V2/deployments/rinkeby"
      },
      {
        artifacts: "node_modules/someotherpackage/artifacts",
      }
    ],
  },
};
