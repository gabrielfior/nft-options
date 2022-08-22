// ethers is already injected

console.log("Fetching hello world contracts");
const contract = $contracts["Options"];

const provider = new ethers.providers.JsonRpcProvider($rpcUrl);
const factory = new ethers.ContractFactory(contract.abi, contract.evm.bytecode, provider.getSigner());

console.log("Deploying options contract")
const options = await factory.deploy()

console.log("Calling owner() function");
console.log(await options.owner());

let NFT_ADDRESS = '0x57f1887a8bf19b14fc0df6fd9b2acc9af147ea85';
await options.dummy(NFT_ADDRESS);
// check if options map was populated and counter as well
console.log("optionsCounter", (await options.optionsCounter()).toNumber());
console.log("map1", await options.optionsMap(1));


