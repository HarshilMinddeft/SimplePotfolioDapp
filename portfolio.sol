// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

contract portfolio{

// Address deployed 0x5409989F095EAa9AAfA390cfF07466Fc9Cef0E46
    struct Project{
        uint id;
        string name;
        string description;
        string image;
        string githubLink;
    }

    struct Education{
        uint id;
        string date;
        string degree;
        string knowledgeAcquired;
        string instutionName;
    }

    Project[3] public projects;
    Education[3] public educationDetails;

    string public imageLink="QmPvEEqeD2sTE9A7sdqCTNQEATd7RpfX3B5Mqb8kMNJodf";
    string public description="Finally Completed 3years in crypto market";
    string public resumeLink="QmNcaiFHKNqYDhqb1jgKBnVErRkzLAMcEmQSBksdevfACW";
    uint projectCount;
    uint educationCount;
    address public manager;
    constructor(){
        manager=msg.sender;
    }
    modifier onlyManager(){
        require(manager==msg.sender,"You are not the manager");
        _;
    }
    // calldata then memory is cheap and when and when we dosent change variable and just insert data we can use calldata
    function insertProject(string calldata _name,string calldata _description, string calldata _image, string calldata _githubLink)external {
        require(projectCount<3,"Only 3 Projects");
        projects[projectCount]=Project(projectCount,_name,_description,_image,_githubLink);
        projectCount++;
    }

    function changeProject(string calldata _name,string calldata _description, string calldata _image, string calldata _githubLink ,uint _projectCount)external {
         require(_projectCount>=0 && _projectCount<3,"Only 3 Projects");
        projects[projectCount]=Project(_projectCount,_name,_description,_image,_githubLink);

        }
    function allProjects() external view returns(Project[3]memory){
        return projects;
    }

    function insertEducation(string calldata _date,string calldata _degree,string calldata _knowledgeAcquired, string calldata _instutionName) external onlyManager{
        require(educationCount<3,"only 3 edu");
        educationDetails[educationCount]=Education(educationCount,_date,_degree,_knowledgeAcquired,_instutionName);
        educationCount++;
    }
    function changeEducation(string calldata _date,string calldata _degree,string calldata _knowledgeAcquired, string calldata _instutionName , uint _educationCount) external onlyManager{
         require(_educationCount>=0 && _educationCount<3,"only 3 edu");
        educationDetails[educationCount]=Education(_educationCount,_date,_degree,_knowledgeAcquired,_instutionName);
    }
     function allEducationDetailes() external view returns(Education[3]memory){
        return educationDetails;
    }
     function changeDescription(string calldata _description) external {
        description=_description;
     }
     function changeResumeLink(string calldata _resumeLink) external onlyManager{
        resumeLink=_resumeLink;
     }
     function changeImageLink(string calldata _imageLink) external onlyManager{
        imageLink=_imageLink;
     }

     function donate() public payable {
        payable(manager).transfer(msg.value);
     }

}