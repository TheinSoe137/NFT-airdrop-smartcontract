import { ethers } from "hardhat";

async function main() {
  const MAX_SUPPLY = 300;

  // Replace after IPFS upload
  const BASE_URI = "ipfs://QmPXv3fhdYf4yPQvtmEcYLVm9nuZk9UAhWH617kf2JjCVp/";

  const PayMint = await ethers.getContractFactory("PayMint");
  const payMint = await PayMint.deploy(MAX_SUPPLY, BASE_URI);

  await payMint.waitForDeployment();

  console.log("PayMint deployed to:", await payMint.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
