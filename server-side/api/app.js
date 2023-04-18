require('dotenv').config()
const express = require('express')
const axios = require('axios')
const bodyParser = require('body-parser')
const app = express()
var admin = require("firebase-admin")
var serviceAccount = require("./serviceAccountKey.json")
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
})

var firestore = admin.firestore()

const { Configuration, OpenAIApi } = require('openai')
const configuration = new Configuration({
    apiKey : "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"
})
// const CHOI_API_KEY = "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"
// const SHEANE_API_KEY = "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"
// const JACOB_API_KEY = "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"
// const CHRIS_API_KEY = "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"

const openai = new OpenAIApi(configuration)

const PORT = 6789

app.use(express.json())
app.use(express.text())
app.use(express.urlencoded({ extended: true }))

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

/* 

TEST CODE

START HERE

*/
app.get("/", async (req, res) => {

    res.status(200).json(
        {
            result : "success"
        }
    )
})

app.get("/test", async (req, res) => {

    try { 
        const response = await openai.createCompletion({
            model : "text-davinci-003",
            prompt : "Say this is a test",
            temperature : 0,
            max_tokens : 7
        })

        console.log(response)

        res.status(200).json({
            result : response.data.choices[0].text
        })
    
    } catch (error) {
        console.log(`There was an error`)
        res.status(400).json({
            message : `There was an error in test${error}`
        })
    }

})

app.get("/firestore/user/test", async (req, res) => {
    try{
        const newUser = {
            id: 'user123',
            name: 'John Doe',
            email: 'john.doe@example.com',
            age: 30,
          };
          
        await addUser(newUser);

    }catch (error){
        console.log(error)
        res.status(500).json({
            message : "An error has occurred on the server side",
            detail : `Error in adding user : ${error}`
        })
    }

    res.status(201).json({
        result : "successful addiition of user"
    })
    
})

app.get("/firestore/syllabus/test", async (req, res) => {
    try{
        const rawData = {
            id: "user123",
            topics: [
                [
                    "1. Communication",
                    "  a. Verbal Communication",
                    "  b. Non-Verbal Communication",
                    "  c. Interpersonal Communication",
                    "  d. Written Communication",
                    "  e. Presentation Skills"
                ],
                [
                    "2. Interpersonal Skills",
                    "  a. Communication Skills",
                    "  b. Teamwork",
                    "  c. Conflict Resolution",
                    "  d. Negotiation",
                    "  e. Leadership"
                ],
                [
                    "1. Snowflake Data Warehouse and Snowflake Schema",
                    "  a. Introduction to Snowflake Data Warehouse",
                    "  b. Understanding Snowflake Schema",
                    "  c. Working with Snowflake Data Warehouse",
                    "  d. Snowflake Data Warehouse Architecture",
                    "  e. Snowflake Schema Design and Implementation"
                ],
                [
                    "2. Designing and Implementing a Full-Scale Data Warehouse Solution",
                    "  a. Introduction to Snowflake Data Warehouse and Snowflake Schema",
                    "  b. Architecting Large-Scale Data Solutions",
                    "  c. Data Migration Projects Using Continuous Integration/Continuous Delivery Techniques",
                    "  d. Writing Advanced SQL Including Query Tuning",
                    "  e. Using Enterprise Applications Tools"
                ],
                [
                    "A. Snowflake Data Warehouse Overview",
                    "  i. Overview of Snowflake Data Warehouse",
                    "  v. Snowflake Administration",
                    "B. Snowflake Schema Design",
                    "  i. Introduction to Snowflake Schema",
                    "C. Snowflake Internals and Integration",
                    "  i. Snowflake Internals",
                    "  v. Snowflake Enterprise Applications",
                    "D. Snowflake Data Platform Blueprint and Design",
                    "  i. Data Platform Components",
                    "  v. Choosing the Best Solution",
                    "E. Snowflake Continuous Integration/Continuous Delivery",
                    "  i. Introduction to Continuous Integration/Continuous Delivery",
                    "  v. Continuous Integration/Continuous Delivery Optimization"
                ],
                [
                    "A. Introduction to Problem-Solving and Architecting",
                    "  i. Overview of Problem-Solving and Architecting",
                    "B. Snowflake Data Warehouse and Snowflake Schema",
                    "  i. Overview of Snowflake Data Warehouse",
                    "C. Architecting Large-Scale Data Solutions",
                    "  i. Overview of Architecting Large-Scale Data Solutions",
                    "D. Data Migration Projects",
                    "  i. Overview of Data Migration Projects",
                    "E. Advanced SQL and Query Tuning",
                    "  i. Overview of Advanced SQL"
                ],
                [
                    "A. Understanding Snowflake Data Warehouse and Snowflake Schema",
                    "B. Designing and Implementing a Full-Scale Data Warehouse Solution",
                    "C. Integrating Snowflake with Other Technologies for Data Processing and Reporting",
                    "D. Architecting Large-Scale Data Solutions",
                    "E. Data Migration Projects Using Continuous Integration/Continuous Delivery Techniques"
                ],
                [
                    "A. Introduction to Data Migration Projects",
                    "  i. Overview of Data Migration",
                    "B. Data Migration Process",
                    "  i. Data Migration Planning",
                    "C. Data Migration Tools",
                    "  i. HP ALM",
                    "  v. Informatica DVO",
                    "D. Advanced SQL and Query Tuning",
                    "  i. Writing Advanced SQL",
                    "E. Data Migration Best Practices",
                    "  i. Security and Privacy Considerations"
                ],
                [
                    "7. Writing Advanced SQL",
                    "  a. Introduction to SQL",
                    "  b. Writing Basic SQL Queries",
                    "  c. Advanced SQL Queries",
                    "  d. Query Tuning",
                    "  e. Working with Data Types and Functions"
                ],
            ]
        }

        const topics = await processTopics(rawData.topics)

        const structuredData = {
            id: rawData.id,
            topics: topics
        }

        console.log(structuredData)
        
        await storeSyllabus(structuredData.id, structuredData.topics)
        .then(() => console.log('Data saved successfully'))
        .catch((error) => console.error('Error saving data:', error));

    }catch (error){
        console.log(error)
        res.status(500).json({
            message : "An error has occurred on the server side",
            detail : `Error in adding syllabus to user document : ${error}`
        })
    }

    res.status(201).json({
        result : "successful addiition of syllabus to user"
    })
    
})

const processTopics = async (topics) => {
    return topics.map((topic) => {
      const [topicName, ...subtopics] = topic;
      return {
        topic_name: topicName,
        completed: false,
        subtopics: subtopics.map((subtopic) => ({
          subtopic_name: subtopic,
          completed: false,
        })),
      };
    });
  }

const storeSyllabus = async (userId, topics) => {
    const userRef = firestore.collection('users').doc(userId.toString())
    const syllabusRef = userRef.collection('syllabus')
  
    for (const topic of topics) {
      const topicRef = await syllabusRef.add({
        topic_name: topic.topic_name,
        completed: topic.completed,
      })
  
      const subtopicsRef = topicRef.collection('subtopics')
      for (const subtopic of topic.subtopics) {
        await subtopicsRef.add({
          subtopic_name: subtopic.subtopic_name,
          completed: subtopic.completed,
        })
      }
    }
}

const addUser = async (user) => {
    try {
      const userRef = firestore.collection('users').doc(user.id); // Replace 'user.id' with a unique identifier for the user
      await userRef.set(user);
      console.log('User added successfully:', user);
    } catch (error) {
      console.error('Error adding user:', error);
    }
}

/*
TEST CODE
END HERE
*/

const listToString = (list) => {
    let string = ''
    for (let item of list) {
      string += item + ', '
    }
    return string.slice(0, -2)
  }
  
/*

LEARNING PATH

*/

const generateResponse = async (prompt) => {
    try{
        const response = await openai.createCompletion(
            {
                model : "text-davinci-003",
                prompt : prompt, 
                temperature : 0.1,
                max_tokens : 1000
            }
        )

        return response

    } catch (error){
        console.log(`Error in generate Response : ${error}`)
        return null
    }

}

const keepBulletsNumbers = (inputList) => {

    const pattern = /^[\s*]*[\d|a-zA-Z]\.|[\s*]*[-–]\s+/
    
    return inputList.filter((s) => pattern.test(s))
}

const cleanList = (inputList) => {
    try{
        // console.log(inputList)
        text = inputList.data.choices[0].text
        console.log(text)
        var cleanedList = text.split('\n')
        console.log(cleanedList)
        cleanedList = cleanedList.filter(x => x)
        console.log(cleanedList)
  
        return cleanedList
    }catch (error){
        console.log(error)
        return null
    }
}
/*
const generatePrompt = (companyName, jobTitle, jobDescription, topicType, topicTitle) => {
    var prompt = ""

    if (topicType == "topic"){
        prompt = `${jobDescription}
        Act as a professional syllabus maker. create a list of titles for a syllabus pathway to attain the skills and knowledge mentioned in the job description for ${jobTitle} in ${companyName}.`
    }else if (topicType == "subtopic"){
        prompt = `${jobDescription}
        Act as a professional syllabus maker. create a list of sub titles for the title "${topicTitle}" for a syllabus pathway to attain the skills and knowledge mentioned in the job description for ${jobTitle} in ${companyName}. The subtopic should be indented and bulleted by a lowercase letters, while the main topic should retain its bulleting format which is numerical.`
    }

    return prompt
}*/

const generatePrompt = (section, purpose, companyName, jobTitle, jobDesc, type, topicTitle, currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, answer, question) => {

    var prompt = ""

    if (section === 'Syllabus'){
        // SYLLABUS PROMPTS

        // UPSKILL
        if (purpose === 'Upskill'){
            if (type === 'topic'){
                if (!currentIndustry){
                    prompt = `Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed to attain the ${targetSkills} skill. Provide 2 topics for soft skills and 7 topics for hard/technical skills.`
                }
                else {
                    prompt = `Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed, in the ${currentIndustry} field, to attain the ${targetSkills} skill. Provide 2 topics for soft skills and 7 topics for hard/technical skills.`
                }
            }else if (type == 'subtopic'){
                if (!currentIndustry){
                    prompt = `Act as a professional syllabus maker. create a list of 5 sub titles for the title "${topicTitle}" for a syllabus pathway to attain the skills and knowledge needed to attain the ${targetSkills} skill. The subtopic should be indented and bulleted by a lowercase letters, while the main topic should retain its bulleting format which is numerical. Example:
                    1. Database Design
                        a. Introduction to Snowflake Data Warehouse
                        b. Designing and Implementing a Snowflake Data Warehouse Solution
                        c. Snowflake Internals and Integration
                        d. Architecting Large-Scale Data Solutions
                        e. Data Migration Projects Using Continuous Integration/Continuous Delivery Techniques`
                }else {
                    prompt = `Act as a professional syllabus maker. create a list of 5 sub titles for the title "${topicTitle}" for a syllabus pathway to attain the skills and knowledge needed, in the ${currentIndustry} field, to attain the ${targetSkills} skill. The subtopic should be indented and bulleted by a lowercase letters[a-z], while the main topic should retain its bulleting format which is numerical. Example:
                    1. Database Design
                        a. Introduction to Snowflake Data Warehouse
                        b. Designing and Implementing a Snowflake Data Warehouse Solution
                        c. Snowflake Internals and Integration
                        d. Architecting Large-Scale Data Solutions
                        e. Data Migration Projects Using Continuous Integration/Continuous Delivery Techniques`
                }
            }
        }
    }else if (purpose === 'Job'){
        // FIRST JOB
        if (type === 'topic'){
            if (!currentIndustry){
                prompt = `${jobDesc}
                Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge mentioned in the job description for ${jobTitle} in ${targetCompany}. Provide 2 topics for soft skills and 7 topics for hard/technical skills.`
            }else {
                prompt = `${jobDesc}
                Act as a professional syllabus maker. create a  numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge mentioned in the job description for ${jobTitle} in ${targetCompany}. Exclude from the syllabus the following skills: ${currentSkills}. Provide 2 topics for soft skills and 7 topics for hard/technical skills.`
            }
        }else if (type === 'subtopic'){
            prompt = `${jobDesc}
            act as a professional syllabus maker. create a list of 5 sub titles for the title "${topicTitle}" for a syllabus pathway to attain the skills and knowledge mentioned in the job description for ${jobTitle} in ${targetCompany}. The subtopic should be indented and bulleted by a lowercase letters[a-z], while the main topic should retain its bulleting format which is numerical. Example:
            1. Database Design
                a. Introduction to Snowflake Data Warehouse
                b. Designing and Implementing a Snowflake Data Warehouse Solution
                c. Snowflake Internals and Integration
                d. Architecting Large-Scale Data Solutions
                e. Data Migration Projects Using Continuous Integration/Continuous Delivery Techniques`
        }
    }else if (purpose === 'Career'){
        // CAREER SHIFT
        if (type === 'topic'){
            if (!currentIndustry){
                prompt = `Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed to attain the skill to switch from ${currentJob} to ${jobTitle} job. Provide 2 topics for soft skills and 7 topics for hard/technical skills.`
        
            }else{
                prompt = `Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed to attain the skill to switch from ${currentJob} (${currentIndustry} field) to ${jobTitle} (${targetIndustry} field) job. Provide 2 topics for soft skills and 7 topics for hard/technical skills.`
            }
        }else if (type === 'subtopic'){
            if (!currentIndustry){
                prompt = `Act as a professional syllabus maker. create a list of 5 sub titles for the title "${topicTitle}" for a syllabus pathway to attain the skills and knowledge needed to attain the skill to switch from ${currentJob} to ${jobTitle} job. The subtopic should be indented and bulleted by a lowercase letters, while the main topic should retain its bulleting format which is numerical. Example:
                1. Database Design
                    a. Introduction to Snowflake Data Warehouse
                    b. Designing and Implementing a Snowflake Data Warehouse Solution
                    c. Snowflake Internals and Integration
                    d. Architecting Large-Scale Data Solutions
                    e. Data Migration Projects Using Continuous Integration/Continuous Delivery Techniques`
            }else {
                prompt = `Act as a professional syllabus maker. create a list of 5 sub titles for the title "${topicTitle}" for a syllabus pathway to attain the skills and knowledge neededto attain the skill to switch from ${currentJob} (${currentIndustry} field) to ${jobTitle} (${targetIndustry} field) job.. The subtopic should be indented and bulleted by a lowercase letters[a-z], while the main topic should retain its bulleting format which is numerical. Example:
                1. Database Design
                    a. Introduction to Snowflake Data Warehouse
                    b. Designing and Implementing a Snowflake Data Warehouse Solution
                    c. Snowflake Internals and Integration
                    d. Architecting Large-Scale Data Solutions
                    e. Data Migration Projects Using Continuous Integration/Continuous Delivery Techniques`
            }
        }
    }

    // For adding the skills, company name, and job description to the prompt if they exist

    if (currentSkills) {
        let addPrompt = ` The syllabus should exclude the following skills: ${targetSkills}.`
        prompt = prompt + addPrompt
    }

    if (companyName) {
        let addPrompt = ` Then, the syllabus should also for landing a job in the ${companyName} company.`
        prompt = prompt + addPrompt
    }

    if (jobDesc) {
        let addPrompt = `${jobDesc}
        `
        
        prompt = addPrompt + prompt
        addPrompt = ` Then, the syllabus should also be focusing on the skills and knowledge needed in the job description mentioned above.`
        prompt = prompt + addPrompt
    }

    // MOCK INTERVIEW PROMPTS
    if (section === 'Interview') {

        // UPSKILL
        if (purpose === 'Upskill') {
            if (type === 'questions') {
                prompt = `Act like an HR Executive who is looking to hire a role in the ${targetIndustry} industry that fits this skillset: ${currentSkills} and is interested in the following skills: ${targetSkills}. List down 5 behavioral question and 5 technical questions based on those information`

                if (companyName) {
                    let addPrompt = ` Additionally, the questions should also be based on the company they are applying for: ${companyName}.`
                    prompt = prompt + addPrompt
                }

                if (jobDesc) {
                    let addPrompt = `
                    ${jobDesc}`
                    prompt = addPrompt + prompt

                    addPrompt = ` Above is the job description of the work they are applying for, take this into consideration when formulating the question.`
                    prompt = prompt + addPrompt
                }
            } else if (type === 'answers') {
                prompt = `Pretend to be a Talent Delivery Specialist that is currently interviewing to hire for a role in the ${targetIndustry} industry and has the following skillset ${currentSkills}. You have asked the question: '${question}', then critique this answer from the applicant: '${answer}' based on the following criteria - qualifications and skills, personality and work style, cultural fit, motivation and enthusiasm, potential for growth and development, and flexibility. Only give a score between 1-10 and a brief review and suggestion for the answer. Strictly follow this format when sending your response: Question: text here Answer: text here Score: ?/10 Review: review and suggestion text here. Do not give a score of 0`
            }
        
        // FIRST JOB
        } else if (purpose === 'Job') {
            if (type === 'questions') {
                prompt = `Act like an HR Executive in the ${targetIndustry} industry and is interviewing a candidate to hire for the position of ${jobTitle}. The candidate has a skillset of: ${currentSkills}, take this into consideration when formulating the questions for the candidate. List down 5 behavioral question and 5 technical questions that can determine if they are fit for the role of ${jobTitle}`

                if (companyName) {
                    let addPrompt = ` Additionally, the questions should also be based on the company they are applying for: ${companyName}.`
                    prompt = prompt + addPrompt
                }

                if (jobDesc) {
                    let addPrompt = `
                    ${jobDesc}`

                    prompt = addPrompt + prompt
                    addPrompt = ` Above is the job description of the work they are applying for, take this into consideration when formulating the question.`
                    prompt = prompt + addPrompt
                }
            } else if (type === 'answers') {
                prompt = `Pretend to be a Talent Delivery Specialist that is currently interviewing to hire for the postion of ${jobTitle}. You have asked the question: '${question}', then critique this answer from the applicant: '${answer}' based on the following criteria - qualifications and skills, personality and work style, cultural fit, motivation and enthusiasm, potential for growth and development, and flexibility. Only give a score between 1-10 and a brief review and suggestion for the answer. Strictly follow this format when sending your response: Question: text here Answer: text here Score: ?/10 Review: review and suggestion text here. Do not give an score of 0."`
            }

        // CAREER SHIFT
        } else if (purpose === 'Career') {
            if (type === 'questions') {
                prompt = `Act like an HR Executive in the ${targetIndustry} industry and is interviewing a candidate to hire for the position of ${jobTitle}. The candidate previously worked in the ${currentIndustry} industry as a ${currentJob} and through that job he gained the following skills: ${currentSkills}. List down 5 behavioral question and 5 technical questions that can determine if they are fit for the role of ${jobTitle}. For the behavioral questions, include questions related on why the applicant has changed jobs or industry.`
        
                if (companyName) {
                    let addPrompt = ` Additionally, the questions should also be based on the company they are applying for: ${companyName}.`
                    prompt = prompt + addPrompt
                }
        
                if (jobDesc) {
                    let addPrompt = `
                    ${jobDesc}`
        
                    prompt = addPrompt + prompt
                    addPrompt = ` Above is the job description of the work they are applying for, take this into consideration when formulating the question.`
                    prompt = prompt + addPrompt
                }
        
            } else if (type === 'answers') {
                prompt = `Pretend to be a Talent Delivery Specialist that is currently interviewing to hire for the postion of ${jobTitle}. You have asked the question: '${question}', then critique this answer from the applicant: '${answer}' based on the following criteria - qualifications and skills, personality and work style, cultural fit, motivation and enthusiasm, potential for growth and development, and flexibility. Only give a score between 1-10 and a brief review and suggestion for the answer. Strictly follow this format when sending your response: Question: text here Answer: text here Score: ?/10 Review: review and suggestion text here. Do not give an score of 0."`
            }
        }

    }

    // COMPANY PROMPTS
    if (section === 'Company') {

        // UPSKILL
        if (purpose === 'Upskill') {
            prompt = `Generate a list of companies suitable for beginners or those with minimal experience in ${targetIndustry} industry who has the following skills, ${currentSkills}, and is also eager to learn more skills such as ${targetSkills}. The list should provide opportunities for growth and development within the company. Please provide at least 5 companies in the Philippines and 5 international companies that meet the criteria and a very brief description of each company or the link to the company website`
        
        // FIRST JOB
        } else if (purpose === 'Job') {
            prompt = `Generate a list of companies suitable for beginners or those with minimal experience in ${targetIndustry} industry and this is their target job, ${jobTitle}, and they current possess the following skills: ${currentSkills}. The list should provide opportunities for growth and development within the company. Please provide at least 5 companies in the Philippines and 5 international companies that meet the criteria and a very brief description of each company or the link to the company website`
        
        // CAREER SHIFT
        } else if (purpose === 'Career') {
            prompt = `Generate a list of companies that a person can apply to based on the following criteria: previous industry: ${currentIndustry}, previous job: ${currentJob}, skills: ${currentSkills}, target industry: ${targetIndustry}, and target job: ${jobTitle}. The list should only include companies that match the job the person wants, ${targetIndustry}, and industry, ${jobTitle}. Prioritize companies that value and have a track record of hiring individuals with similar current job: ${currentJob}, skills: ${currentSkills}, and industry experience: ${currentIndustry}. Additionally, consider factors such as company culture and overall reputation. Please provide at least 5 companies in the Philippines and 5 international companies that meet the criteria, and a very brief description of each company or the link to the company website`

            // For adding the company name, and job description to the prompt if they exist

            if (companyName) {
                let addPrompt = ` Additionally, the person is targeting to enter this company ${companyName}, therefore, you can look for similar companies such as this one.`
                prompt = prompt + addPrompt
            }

            if (jobDesc) {
                let addPrompt = `${jobDesc}
                `

                prompt = addPrompt + prompt
                addPrompt = ` The text above is the job description of the position the person is aiming for, take this into cosideration as well in adding companies into the list.`
                prompt = prompt + addPrompt
            }
        }
    }
    // end of Company prompts

    // JOB PROMPTS
    if (section === 'Job') {

        // UPSKILL
        if (purpose === 'Upskill') {
            prompt = `Generate a list of jobs suitable for individuals who want to enter the ${targetIndustry} industry and who are looking to enhance the following skills ${targetSkills}. The generated list should also take into consideration the individual's current skill set, ${currentSkills}. Please provide 5 job titles and a very brief description of each job that will fit the person's skills and experience. list the role and the brief description, do not include any company in the list and do not include the previous job in the list.`
        
        // FIRST JOB
        } else if (purpose === 'Job') {
            prompt = `Generate a list of entry-level jobs in the ${targetIndustry} industry that match the following criteria: Job title similar to ${jobTitle}, Required or wanted skills include ${currentSkills}. Please provide 5 job titles and a very brief description of each job that will fit the person's skills and experience. Only list the role and the brief description, do not include any company in the list and do not include the previous job in the list.`
        
        // CAREER SHIFT
        } else if (purpose === 'Career') {
            prompt = `Generate a list of jobs that a person can aim for based on their previous industry: ${currentIndustry}, previous job: ${currentJob}, skills: ${currentSkills}, target industry: ${targetIndustry}, and target job ${jobTitle}. The person is looking to shift their career or move to a different job. Please provide 5 job titles and a very brief description of each job that will fit the person's skills and experience. Only list the role and the brief description, do not include any company in the list and do not include the previous job in the list.`

            if (companyName) {
                let addPrompt = ` Additionally, the person is targeting get into this company ${companyName}, therefore, you can look for roles that is similar to the person's target job and is also known in this company.`
                prompt = prompt + addPrompt
            }

            if (jobDesc) {
                let addPrompt = `${jobDesc}
                `

                prompt = addPrompt + prompt
                addPrompt = ` The text above is the job description of the position the person is aiming for, take this into cosideration as well in adding jobs into the list.`
                prompt = prompt + addPrompt
            }
        }
    }

    if (section == 'Insurance'){
        if (type == 'promotion'){
            prompt = `Act as a professional financial advisor. Kindly provide information and promote the FWD insurance company in the philippines, metion their information the about the company and its vision and mission.Then, Create a bulleted list of the insurances, and its details, offered by FWD.Then, provide also the info on how to get an insurance in the FWD. Provide the services offered and benefits. ALso, provide the contact details of the company. Then, provide tips and tricks on how to get the best insurance plan.`
        }else if (type == 'list'){
            prompt = `Act as a professional financial advisor. Create a numerical bulleted list of 10 insurances. Then, create also a sub bulleted list that has  5-10 company provider of that insurance, that is in the Philippines. Kindly put the FWD insurace at the top of the company list if it is in the list.`
        }
    }
    // end of Job prompts
    
    return prompt

}
/*

def generate_syllabus(topics_list):
    syllabus = []

    for topic in topics_list:
        prompt = generate_prompt('Syllabus', 'Upskill', target_company, desired_job, job_desc, 'subtopic', topic, skills_str, target_skills, current_industry, current_job, target_industry, '', '')
        # prompt = generate_prompt(target_company, desired_job, job_desc, 'subtopic', topic, '')
        subtopic = generate_response(prompt)
        subtopic = clean_lst(subtopic)
        syllabus.append(subtopic)
    # end of for loop
    
    return syllabus
# end of generate_syllabus

const generateSyllabus = async (userInfo, topicList) => {
    const syllabus = []

    // const asyncResults = await Promise.all(topicList.map((topicList) => ))

    try{
        for (let topic of topicList){
            const prompt = generatePrompt(userInfo.companyName, userInfo.jobTitle, userInfo.jobDescription, 'subtopic', topic)
            let subtopic = await generateResponse(prompt)
            console.log(subtopic)
            subtopic = cleanList(subtopic)
            subtopic = keepBulletsNumbers(subtopic)
            syllabus.push(subtopic)
        }
    
        return syllabus
    }catch (error){
        console.log(`Error in generate syllabus function: ${error}`)
        return null
    }
    
}

app.post("/syllabus/generate", async (req, res) => {

    const companyName = req.body.companyName
    const jobTitle = req.body.jobTitle
    const jobDecs = req.body.jobDesc

    // let companyName = "Accenture"
    // let jobTitle = "Data Engineer"
    // let jobDecs = `The work:

    // Assists with the data platform blueprint and design, encompassing the relevant data platform components.
    // Collaborates with the Integration Architects and Data Architects to ensure cohesive integration between systems and data models.
    // Requirements:

    // Knowledgeable in Snowflake Data Warehouse and Snowflake Schema
    // Minimum of 1 year of experience designing and implementing a full-scale data warehouse solution based on Snowflake
    // Expertise and excellent proficiency with Snowflake internals and integration of Snowflake with other technologies for data processing and reporting
    // A highly effective communicator, both orally and in writing
    // Problem-solving and architecting skills in cases of unclear requirements
    // A minimum of 1 year of experience architecting large-scale data solutions, performing architectural assessments, examining architectural alternatives, and choosing the best solution in collaboration with both IT and business stakeholder
    // Experience in data migration projects using continuous integration/continuous delivery techniques.
    // Experience in writing advanced SQL including query tuning.
    // Experience using enterprise applications tools: HP ALM, JIRA, Jenkins, QuerySurge, Informatica DVO, Version control tool(ex. GIT)`

    const prompt = generatePrompt(companyName, jobTitle, jobDecs, 'topic', '')
    var topicList = await generateResponse(prompt)
    topicList = cleanList(topicList)
    topicList = keepBulletsNumbers(topicList)

    const userInfo  = {
        companyName : companyName,
        jobTitle : jobTitle,
        jobDescription : jobDecs
    }

    console.log(topicList)
    const syllabus = await generateSyllabus(userInfo, topicList)

    res.status(200).json(
        {
            result : syllabus
        }
    )
})
*/

const generateSyllabus = async (userInfo, topicList) => {
    const syllabus = []

    try{
        for (let topic of topicList){
            const prompt = generatePrompt('Syllabus', 'Upskill', userInfo.targetCompany, userInfo.desiredJob, userInfo.jobDesc, 'subtopic', topic, userInfo.currentSkills, userInfo.targetSkills)
            let subtopic = await generateResponse(prompt)
            subtopic = cleanList(subtopic)
            subtopic = keepBulletsNumbers(subtopic)
            syllabus.push(subtopic)
        }
    }catch (error){
        console.log(`Error in generate syllabus function: ${error}`)
        return null
    }
    return syllabus
}

app.post("/syllabus/generate", async (req, res) => {

    try{
        // const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body

        var purpose = req.body.purpose
        var currentIndustry = req.body.currentIndustry
        var targetIndustry = req.body.targetIndustry
        var desiredJob = req.body.desiredJob
        var currentJob = req.body.currentJob
        var currentSkills = req.body.currentSkills
        var targetSkills = req.body.targetSkills
        var targetCompany = req.body.targetCompany
        var jobDesc = req.body.jobDesc

    }catch (error){
        res.status(400).json({
            message : "Required fields not provided",
            details: `${error}`
        })
    }

    /*

    const purpose = 'Upskill'

    const currentIndustry = 'Technology'

    const targetIndustry = 'Technology'

    const desiredJob = 'Data Engineer'

    const currentJob = 'AI Engineer'

    var currentSkills = ['Python', 'SQL', 'Machine learning', 'Deep learning', 'Data visualization', 'Data analysis', 'Data cleaning', 'Data wrangling', 'Data engineering', 'Data architecture', 'Data modeling', 'Data mining', 'Data extraction', 'Data transformation', 'Data integration', 'Data governance', 'Data security', 'Data privacy', 'Data ethics', 'Data architecture']

    const targetSkills = 'Graphic Design'

    const targetCompany = 'Accenture'

    const jobDesc =`The work:

    Assists with the data platform blueprint and design, encompassing the relevant data platform components.
    Collaborates with the Integration Architects and Data Architects to ensure cohesive integration between systems and data models. 
    Requirements:

    Knowledgeable in Snowflake Data Warehouse and Snowflake Schema
    Minimum of 1 year of experience designing and implementing a full-scale data warehouse solution based on Snowflake
    Expertise and excellent proficiency with Snowflake internals and integration of Snowflake with other technologies for data processing and reporting
    A highly effective communicator, both orally and in writing
    Problem-solving and architecting skills in cases of unclear requirements
    A minimum of 1 year of experience architecting large-scale data solutions, performing architectural assessments, examining architectural alternatives, and choosing the best solution in collaboration with both IT and business stakeholder
    Experience in data migration projects using continuous integration/continuous delivery techniques.
    Experience in writing advanced SQL including query tuning.
    Experience using enterprise applications tools: HP ALM, JIRA, Jenkins, QuerySurge, Informatica DVO, Version control tool(ex. GIT)`

    */

    try{
        currentSkills = listToString(currentSkills)
    
        const syllabusPrompt = generatePrompt('Syllabus', purpose, targetCompany, desiredJob, jobDesc, 'topic', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')
    
        var topicsList = await generateResponse(syllabusPrompt)
        // console.log(topicsList)
        topicsList = cleanList(topicsList)
        topicsList = keepBulletsNumbers(topicsList)
        // console.log(topicsList)
        // console.log(`Finished printing topicsList`)

        const userInfo = {
            targetCompany : targetCompany,
            desiredJob : desiredJob,
            jobDesc : jobDesc, 
            currentSkills : currentSkills,
            targetSkills : targetSkills
        }
    
        var syllabus = await generateSyllabus(userInfo, topicsList)

        console.log(syllabus)

        console.log(`Finished printing syllabus`)

    }catch (error){
        res.status(500).json({
            mesage : "An error has occurred on the server side",
            detail : `Error generating syllabs : ${error}`
        })
    }

    try{
        const questionsPrompt = generatePrompt('Interview', purpose, targetCompany, desiredJob, jobDesc, 'questions', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')

        var questionsList = await generateResponse(questionsPrompt)
        questionsList = cleanList(questionsList)

        var indicesToRemove = [0, 6]

        // Question Cleaning

        for (const index of indicesToRemove.reverse()) {
            questionsList.splice(index, 1)
        }
        
        for (let i = 0; i < questionsList.length; i++) {
            const question = questionsList[i]
            questionsList[i] = question.substring(question.indexOf('.') + 2)
        }
    }catch (error){
        res.status(500).json({
            message : "An error has occurred on the server side",
            detail : `Error generating mock interview questions : ${error}`
        })
    }

    res.status(200).json(
        {
            result : {
                syllabus : syllabus,
                questions : questionsList
            }
        }
    )
})

app.post("/v2/syllabus/generate", async (req, res) => {

    try{
        // const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body

        var purpose = req.body.purpose
        var currentIndustry = req.body.currentIndustry
        var targetIndustry = req.body.targetIndustry
        var desiredJob = req.body.desiredJob
        var currentJob = req.body.currentJob
        var currentSkills = req.body.currentSkills
        var targetSkills = req.body.targetSkills
        var targetCompany = req.body.targetCompany
        var jobDesc = req.body.jobDesc

    }catch (error){
        res.status(400).json({
            message : "Required fields not provided",
            details: `${error}`
        })
    }

    /*

    const purpose = 'Upskill'

    const currentIndustry = 'Technology'

    const targetIndustry = 'Technology'

    const desiredJob = 'Data Engineer'

    const currentJob = 'AI Engineer'

    var currentSkills = ['Python', 'SQL', 'Machine learning', 'Deep learning', 'Data visualization', 'Data analysis', 'Data cleaning', 'Data wrangling', 'Data engineering', 'Data architecture', 'Data modeling', 'Data mining', 'Data extraction', 'Data transformation', 'Data integration', 'Data governance', 'Data security', 'Data privacy', 'Data ethics', 'Data architecture']

    const targetSkills = 'Graphic Design'

    const targetCompany = 'Accenture'

    const jobDesc =`The work:

    Assists with the data platform blueprint and design, encompassing the relevant data platform components.
    Collaborates with the Integration Architects and Data Architects to ensure cohesive integration between systems and data models. 
    Requirements:

    Knowledgeable in Snowflake Data Warehouse and Snowflake Schema
    Minimum of 1 year of experience designing and implementing a full-scale data warehouse solution based on Snowflake
    Expertise and excellent proficiency with Snowflake internals and integration of Snowflake with other technologies for data processing and reporting
    A highly effective communicator, both orally and in writing
    Problem-solving and architecting skills in cases of unclear requirements
    A minimum of 1 year of experience architecting large-scale data solutions, performing architectural assessments, examining architectural alternatives, and choosing the best solution in collaboration with both IT and business stakeholder
    Experience in data migration projects using continuous integration/continuous delivery techniques.
    Experience in writing advanced SQL including query tuning.
    Experience using enterprise applications tools: HP ALM, JIRA, Jenkins, QuerySurge, Informatica DVO, Version control tool(ex. GIT)`

    */

    try{
        currentSkills = listToString(currentSkills)
    
        const syllabusPrompt = generatePrompt('Syllabus', purpose, targetCompany, desiredJob, jobDesc, 'topic', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')
    
        var topicsList = await generateResponse(syllabusPrompt)
        // console.log(topicsList)
        topicsList = cleanList(topicsList)
        topicsList = keepBulletsNumbers(topicsList)
        // console.log(topicsList)
        // console.log(`Finished printing topicsList`)

        const userInfo = {
            targetCompany : targetCompany,
            desiredJob : desiredJob,
            jobDesc : jobDesc, 
            currentSkills : currentSkills,
            targetSkills : targetSkills
        }
    
        var syllabus = await generateSyllabus(userInfo, topicsList)

        console.log(syllabus)

        console.log(`Finished printing syllabus`)

    }catch (error){
        res.status(500).json({
            mesage : "An error has occurred on the server side",
            detail : `Error generating syllabs : ${error}`
        })
    }

    res.status(200).json(
        {
            result : syllabus
        }
    )
})


/*

MOCK INTERVIEW

*/

app.post("/questions/generate", async (req, res) => {

    try{
        // const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body

        var purpose = req.body.purpose
        var currentIndustry = req.body.currentIndustry
        var targetIndustry = req.body.targetIndustry
        var desiredJob = req.body.desiredJob
        var currentJob = req.body.currentJob
        var currentSkills = req.body.currentSkills
        var targetSkills = req.body.targetSkills
        var targetCompany = req.body.targetCompany
        var jobDesc = req.body.jobDesc

    }catch (error){
        res.status(400).json({
            message : "Required fields not provided",
            details: `${error}`
        })
    }

    /*
    const purpose = 'Upskill'

    const currentIndustry = 'Technology'

    const targetIndustry = 'Technology'

    const desiredJob = 'Data Engineer'

    const currentJob = 'AI Engineer'

    var currentSkills = ['Python', 'SQL', 'Machine learning', 'Deep learning', 'Data visualization', 'Data analysis', 'Data cleaning', 'Data wrangling', 'Data engineering', 'Data architecture', 'Data modeling', 'Data mining', 'Data extraction', 'Data transformation', 'Data integration', 'Data governance', 'Data security', 'Data privacy', 'Data ethics', 'Data architecture']

    const targetSkills = 'Graphic Design'

    const targetCompany = 'Accenture'

    const jobDesc =`The work:

    Assists with the data platform blueprint and design, encompassing the relevant data platform components.
    Collaborates with the Integration Architects and Data Architects to ensure cohesive integration between systems and data models. 
    Requirements:

    Knowledgeable in Snowflake Data Warehouse and Snowflake Schema
    Minimum of 1 year of experience designing and implementing a full-scale data warehouse solution based on Snowflake
    Expertise and excellent proficiency with Snowflake internals and integration of Snowflake with other technologies for data processing and reporting
    A highly effective communicator, both orally and in writing
    Problem-solving and architecting skills in cases of unclear requirements
    A minimum of 1 year of experience architecting large-scale data solutions, performing architectural assessments, examining architectural alternatives, and choosing the best solution in collaboration with both IT and business stakeholder
    Experience in data migration projects using continuous integration/continuous delivery techniques.
    Experience in writing advanced SQL including query tuning.
    Experience using enterprise applications tools: HP ALM, JIRA, Jenkins, QuerySurge, Informatica DVO, Version control tool(ex. GIT)`
    */

    currentSkills = listToString(currentSkills)

    const questionsPrompt = generatePrompt('Interview', purpose, targetCompany, desiredJob, jobDesc, 'questions', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')

    var questionsList = await generateResponse(questionsPrompt)
    questionsList = cleanList(questionsList)

    var indicesToRemove = [0, 6]

    // Question Cleaning

    for (const index of indicesToRemove.reverse()) {
        questionsList.splice(index, 1)
    }
    
    for (let i = 0; i < questionsList.length; i++) {
        const question = questionsList[i]
        questionsList[i] = question.substring(question.indexOf('.') + 2)
    }

    res.status(200).json({
        result : questionsList
    })

})

app.post("/answers/submit", async (req, res) => {

    const startTime = Date.now()

    try{
        // const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body

        var purpose = req.body.purpose
        var currentIndustry = req.body.currentIndustry
        var targetIndustry = req.body.targetIndustry
        var desiredJob = req.body.desiredJob
        var currentJob = req.body.currentJob
        var currentSkills = req.body.currentSkills
        var targetSkills = req.body.targetSkills
        var targetCompany = req.body.targetCompany
        var jobDesc = req.body.jobDesc
        var answersList = req.body.answersList
        var questionsList = req.body.questionsList

    }catch (error){
        res.status(400).json({
            message : "Required fields not provided",
            details: `${error}`
        })
    }

    // var answersList = ['Answer 1', 'Answer 2', 'Answer 3']

    /*
    const purpose = 'Upskill'

    const currentIndustry = 'Technology'

    const targetIndustry = 'Technology'

    const desiredJob = 'Data Engineer'

    const currentJob = 'AI Engineer'

    var currentSkills = ['Python', 'SQL', 'Machine learning', 'Deep learning', 'Data visualization', 'Data analysis', 'Data cleaning', 'Data wrangling', 'Data engineering', 'Data architecture', 'Data modeling', 'Data mining', 'Data extraction', 'Data transformation', 'Data integration', 'Data governance', 'Data security', 'Data privacy', 'Data ethics', 'Data architecture']

    const targetSkills = 'Graphic Design'

    const targetCompany = 'Accenture'

    const jobDesc =`The work:

    Assists with the data platform blueprint and design, encompassing the relevant data platform components.
    Collaborates with the Integration Architects and Data Architects to ensure cohesive integration between systems and data models. 
    Requirements:

    Knowledgeable in Snowflake Data Warehouse and Snowflake Schema
    Minimum of 1 year of experience designing and implementing a full-scale data warehouse solution based on Snowflake
    Expertise and excellent proficiency with Snowflake internals and integration of Snowflake with other technologies for data processing and reporting
    A highly effective communicator, both orally and in writing
    Problem-solving and architecting skills in cases of unclear requirements
    A minimum of 1 year of experience architecting large-scale data solutions, performing architectural assessments, examining architectural alternatives, and choosing the best solution in collaboration with both IT and business stakeholder
    Experience in data migration projects using continuous integration/continuous delivery techniques.
    Experience in writing advanced SQL including query tuning.
    Experience using enterprise applications tools: HP ALM, JIRA, Jenkins, QuerySurge, Informatica DVO, Version control tool(ex. GIT)`
    */

    // let index = 0;

    try{
        var evaluationList = [];

        console.log(answersList)

        for (let i = 0; i < answersList.length; i++){
            console.log(answersList[i])
        }

        console.log(questionsList)

        for (let i = 0; i < questionsList.length; i++){
            console.log(questionsList[i])
        }

        console.log('Entering evaluation generation loop')

        for (let i = 0; i < answersList.length; i++) {
            let prompt = generatePrompt('Interview', purpose, targetCompany, desiredJob, jobDesc, 'answers', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, answersList[i], questionsList[i]);
            const eval = await generateResponse(prompt);

            const evaluationString = eval.data.choices[0].text.trim();

            evaluationList.push(evaluationString);
        }

        console.log(evaluationList)

        console.log('Entering evaluation cleaning loop')

        for (let i = 0; i < evaluationList.length; i++) {
            const evaluation = evaluationList[i];
            const lines = evaluation.split('\n').filter(line => line.trim()).map(line => line.trim());
            const cleanText = lines.join(' ')
                .replace("Suggestion: ", "")
                .replace("Answer: ", "\nAnswer: ")
                .replace("Review: ", "\nReview: ")
                .replace("Score: ", "\nScore: ")
                .split('\n');
                evaluationList[i] = cleanText;
        }

        const evalCopy = [...evaluationList]
        const numericValues = []

        const evalString = evalCopy.map(String).join(', ')

        console.log(evalString)

        console.log('Entering 2nd evaluation cleaning loop')

        for (let i = 0; i < evalString.length; i++) {
            if (i > 0 && evalString[i - 1] === '/') {
                continue;
            }
            const match = evalString[i].match(/\d+/g);

            if (match) {
                for (const number of match) {
                    if (number !== '0') {
                        numericValues.push(parseInt(number, 10));
                    }
                }
            }
        }

        console.log('Exited evaluation generation loop')

        console.log(evaluationList)

        const averageScore = numericValues.reduce((a, b) => a + b) / numericValues.length;

        evaluationList.push(`Overall Score: ${averageScore}`);

    }catch (error){
        res.status(500).json({
            message :  "An error has occurred on the server side",
            detail : `Error while fetching and processing evaluation : ${error}`
        })
    }

    const endTime = Date.now()

    const totalElapsed = endTime - startTime
    
    res.status(200).json({
        result : evaluationList,
        metadata : {
            timeTaken : totalElapsed
        }
    })
})

app.post("/companies/generate", async (req, res) => {

    try{
        // const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body

        var purpose = req.body.purpose
        var currentIndustry = req.body.currentIndustry
        var targetIndustry = req.body.targetIndustry
        var desiredJob = req.body.desiredJob
        var currentJob = req.body.currentJob
        var currentSkills = req.body.currentSkills
        var targetSkills = req.body.targetSkills
        var targetCompany = req.body.targetCompany
        var jobDesc = req.body.jobDesc

    }catch (error){
        res.status(400).json({
            message : "Required fields not provided",
            details: `${error}`
        })
    }

    try{
        currentSkills = listToString(currentSkills)
        const prompt = generatePrompt('Company', purpose, targetCompany, desiredJob, jobDesc, '', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')
        var companiesList = await generateResponse(prompt)
        console.log(companiesList)
        companiesList = cleanList(companiesList)
        console.log(companiesList)
        companiesList = keepBulletsNumbers(companiesList)
        console.log(companiesList)

        }catch (error){
        res.status(500).json({
            message : 'An error has occurred on the server side',
            detail : `${error}`
        })
    }

    res.status(200).json({
        result : companiesList
    })
})

app.post("/promotion/generate", async (req, res) => {
    try{
        // const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body

        var purpose = req.body.purpose
        var currentIndustry = req.body.currentIndustry
        var targetIndustry = req.body.targetIndustry
        var desiredJob = req.body.desiredJob
        var currentJob = req.body.currentJob
        var currentSkills = req.body.currentSkills
        var targetSkills = req.body.targetSkills
        var targetCompany = req.body.targetCompany
        var jobDesc = req.body.jobDesc

    }catch (error){
        res.status(400).json({
            message : "Required fields not provided",
            details: `${error}`
        })
    }

    try{
        currentSkills = listToString(currentSkills)
        const prompt = generatePrompt('Insurance', purpose, targetCompany, desiredJob, jobDesc, 'promotion', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')
        var promotion = await generateResponse(prompt)
        console.log(promotion)
        promotion = cleanList(promotion)
        console.log(promotion)

    }catch (error){
        res.status(500).json({
            message : "An error has occurred on the server side",
            details : `Error while generating promotions: ${error}`
        })
    }


    res.status(200).json({
        result : promotion
    })

})

app.post("/insurance_list/generate", async (req, res) => {
    try{
        // const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body

        var purpose = req.body.purpose
        var currentIndustry = req.body.currentIndustry
        var targetIndustry = req.body.targetIndustry
        var desiredJob = req.body.desiredJob
        var currentJob = req.body.currentJob
        var currentSkills = req.body.currentSkills
        var targetSkills = req.body.targetSkills
        var targetCompany = req.body.targetCompany
        var jobDesc = req.body.jobDesc

    }catch (error){
        res.status(400).json({
            message : "Required fields not provided",
            details: `${error}`
        })
    }

    try {
        currentSkills = listToString(currentSkills)
        const prompt = generatePrompt('Insurance', purpose, targetCompany, desiredJob, jobDesc, 'list', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')
        var insuranceList = await generateResponse(prompt)
        console.log(insuranceList)
        insuranceList = cleanList(insuranceList)
        console.log(insuranceList)
        insuranceList = keepBulletsNumbers(insuranceList)
        console.log(insuranceList)
    
    }catch (error) {
        res.status(500).json({
            message : "An error has occurred on the server side",
            details : `Error while fetching insurance list : ${error}`
        })
    }

    res.status(200).json({
        result : insuranceList
    })
})
  
// LISTEN PORT

app.listen(process.env.PORT || PORT, () => { 
    console.log(`Listening on PORT ${PORT}`)
})