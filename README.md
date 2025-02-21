# Dynamic Token Pricing

## Description
This project implements a cryptocurrency token with a **dynamic pricing mechanism** that adjusts the token price based on transaction volume. Instead of having a fixed price, the token price **increases when users buy tokens and decreases when they sell**, creating a self-regulating supply-demand model.

## Features
- **Dynamic Pricing**: Token price adjusts based on transaction volume.
- **Self-Regulating Model**: Encourages market stability through automatic price adjustments.
- **Decentralized Implementation**: Fully deployed on the blockchain.

## Smart Contract Address
`0x5964Ec717a15FC0408a4d75c68C34Ad850B7Fba8`

## Getting Started
### Prerequisites
- Node.js & npm
- Hardhat or Truffle for smart contract deployment
- Metamask or a web3-compatible wallet

### Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/dynamic-token-pricing.git
   cd dynamic-token-pricing
   ```

2. Install dependencies:
   ```sh
   npm install
   ```

3. Compile the smart contract:
   ```sh
   npx hardhat compile
   ```

4. Deploy the contract (ensure you have configured the network properly in `hardhat.config.js`):
   ```sh
   npx hardhat run scripts/deploy.js --network your-network
   ```

## Usage
### Interacting with the Smart Contract
You can interact with the contract using Ethers.js or Web3.js. Example using Ethers.js:
```js
const contractAddress = "0x5964Ec717a15FC0408a4d75c68C34Ad850B7Fba8";
const contractABI = [ /* ABI goes here */ ];
const provider = new ethers.providers.Web3Provider(window.ethereum);
const signer = provider.getSigner();
const contract = new ethers.Contract(contractAddress, contractABI, signer);

// Example: Buying tokens
const buyTokens = async (amount) => {
    const tx = await contract.buyTokens(amount, { value: ethers.utils.parseEther("0.1") });
    await tx.wait();
    console.log("Tokens purchased successfully");
};
```

## Contributing
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

## License
This project is licensed under the MIT License.

## Contact
For any questions, feel free to reach out or open an issue in the repository.


