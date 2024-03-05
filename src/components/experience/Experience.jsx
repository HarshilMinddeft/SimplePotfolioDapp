import { useEffect, useState } from "react";
import { SlCalender } from "react-icons/sl";
import "./Experience.css";

const Experience = ({ state }) => {
  const [education, setEducation] = useState("");

  useEffect(() => {
    const { contract } = state;
    const educationDetailes = async () => {
      const education = await contract.methods.allEducationDetailes().call();
      setEducation(education);
    };
    contract && educationDetailes();
  }, [state]);
  return (
    <section className="exp-section">
      <h1 className="title">Experience & Education </h1>
      <div className="container">
        <div className="education">
          <h1 className="edu-tittle">Education</h1>
          {education !== "" &&
            education.map((edu) => {
              return (
                <div className="edu-card">
                  <p className="card-text1">
                    <SlCalender className="icon" /> {edu.date}
                  </p>
                  <h3 className="card-text2">{edu.degree}</h3>
                  <p className="card-text3">{edu.knowledgeAcquired}</p>
                  <p className="card-text4">{edu.instutionName}</p>
                </div>
              );
            })}
        </div>
      </div>
    </section>
  );
};

export default Experience;
