const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying RoyaltyDistributor contract with deployer:", deployer.address);

  const RoyaltyDistributor = await hre.ethers.getContractFactory("RoyaltyDistributor");
  const royaltyDistributor = await RoyaltyDistributor.deploy();

  await royaltyDistributor.deployed();

  console.log("✅ RoyaltyDistributor contract deployed at:", royaltyDistributor.address);
}

main().catch((error) => {
  console.error("❌ Deployment failed:", error);
  process.exitCode = 1;
});
