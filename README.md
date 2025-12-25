# NFT Claim Contract on Sepolia ETH

A Solidity smart contract that implements a **paid NFT claim mechanism** using a creator-controlled pre-mint and airdrop model.

Users pay ETH to claim an ERC-721 NFT that was pre-minted to the contract.

---
## Live Dapp 
`https://nft-airdrop-claim-dapp-seoplia.vercel.app/`
## Sepolia Etherscan 
`https://sepolia.etherscan.io/address/0x1B6703d190624E6473B6f89b7bfAFfF666E042fC`

## Deployed Contract

- **Network:** Ethereum Sepolia
- **Address:**  
  `0x1B6703d190624E6473B6f89b7bfAFfF666E042fC`
- **Standard:** ERC-721 (OpenZeppelin)
- **Verification:** Verified on Etherscan

---

## Contract Overview

### Core Idea

Instead of public minting:
- The **creator pre-mints NFTs to the contract**
- Users **pay ETH to claim** an NFT from the contract’s balance

This model is commonly used for:
- Paid NFT drops
- Token-gated access
- Airdrop-to-paid-user flows
- NFT minting

---

## Key Functions

### `payAndClaim()`


function payAndClaim() external payable
Requires exactly 0.001 ETH as a claim fee

Checks that NFTs are still available

Transfers one NFT from contract → user

Emits NFTClaimed event

mintToContract(uint256 amount)
Owner-only

Pre-mints NFTs to the contract address

Used to seed inventory for paid claims

event NFTClaimed(address indexed user, uint256 tokenId);
Emitted after a successful claim.

Security Considerations
Uses OpenZeppelin ERC-721 implementation

Ownership controlled via Ownable

ETH value checks enforced

No external calls during state changes

Simple and auditable logic

### Tech Stack
Solidity

OpenZeppelin Contracts

Hardhat

Etherscan Verification

Dynamic pricing

Merkle allowlist

Mainnet deployment

