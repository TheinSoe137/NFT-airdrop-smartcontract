import { ethers } from "hardhat";

async function main() {
  const CONTRACT_ADDRESS = "0x1B6703d190624E6473B6f89b7bfAFfF666E042fC";

  const payMint = await ethers.getContractAt("PayMint", CONTRACT_ADDRESS);

  const tx = await payMint.mintToContract(1);
  console.log("Mint tx sent:", tx.hash);

  await tx.wait();
  console.log("Mint successful");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
