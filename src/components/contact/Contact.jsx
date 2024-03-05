import { useEffect, useState } from "react";
import "./Contact.css";

const Contact = ({ state }) => {
  const [resume, setresume] = useState("");
  useEffect(() => {
    const { contract } = state;
    const resumeDetailes = async () => {
      const resumeCid = await contract.methods.resumeLink().call();
      setresume("https://gateway.pinata.cloud/ipfs/" + resumeCid);
    };
    contract && resumeDetailes();
  }, [state]);
  return (
    <section className="contact-section">
      <h1 className="title">Interested? Let's Get In Touch!</h1>
      <a href={resume} target="_blank" rel="noopener noreferrer">
        <button className="downlodeBTN">View Resume</button>
      </a>
    </section>
  );
};

export default Contact;
