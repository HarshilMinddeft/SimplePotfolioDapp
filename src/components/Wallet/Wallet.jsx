import ABI from "./ABI.json";
import { useState } from "react";
import "./Wallet.css";
import Web3 from "web3";

const Wallet = ({ saveState }) => {
  const [connected, setConnect] = useState(true);
  const init = async () => {
    try {
      const web3 = new Web3(window.ethereum);
      await window.ethereum.request({ method: "eth_requestAccounts" });
      const contract = new web3.eth.Contract(
        ABI,
        "0x5409989f095eaa9aafa390cff07466fc9cef0e46"
      );
      setConnect(false);
      saveState({ web3: web3, contract: contract });
      console.log(contract);
    } catch (error) {
      console.log(error);
      alert("Install metamask");
    }
  };

  return (
    <>
      <div className="header">
        <button className="connectBTN" onClick={init} disabled={!connected}>
          {connected ? "Connect Metamask" : "connected"}
        </button>
      </div>
    </>
  );
};
export default Wallet;
