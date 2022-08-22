module.exports = async ({
  getNamedAccounts,
  deployments,
  getChainId,
  getUnnamedAccounts,
}) => {
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();

  const blockNumBefore = await ethers.provider.getBlockNumber();
  const blockBefore = await ethers.provider.getBlock(blockNumBefore);
  const timestampBefore = blockBefore.timestamp;


  
  const artifact = await deployments.getArtifact("SmartNft");
  console.log('artif', artifact);

  /*
  await deploy('Options', {
    from: deployer,
    args: [timestampBefore * 2], // constructor args
    gasLimit: 4000000,
    log: true,
    value: ethers.utils.parseEther("0.001")
  });
  */
};