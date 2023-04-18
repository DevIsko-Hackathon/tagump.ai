require('dotenv').config()
const express = require('express')
const axios = require('axios')
const bodyParser = require('body-parser')
const app = express()

const { Configuration, OpenAIApi } = require('openai')
const configuration = new Configuration({
    apiKey : "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"
})

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

        // console.log(response)

        res.status(200).json({
            result : response
        })
    
        
    } catch (error) {
        console.log(`There was an error`)
        res.status(400).json({
            message : `${error}`
        })
    }

})

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
        const response = await OpenAI.createCompletion(
            {
                model : "text-davinci-003",
                prompt : prompt, 
                temperature : 0.1,
                max_tokens : 1000
            }
        )

        return response

    } catch (error){
        console.log(`${error}`)
        return null
    }

}

const keepBulletsNumbers = (inputList) => {

    const pattern = /^[\s*]*[\d|a-zA-Z]\.|[\s*]*[-–]\s+/
    
    return inputList.filter(s => pattern.test(s))
}

const cleanList = (inputList) => {
    try{
        console.log(inputList)
        text = inputList.data.choices[0].text
        var cleanedList = text.split('\n')
        cleanedList = cleanedList.filter(x => x)
  
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
                    prompt = `Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed to attain the ${targetSkills} skill.`
                }
                else {
                    prompt = `Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed, in the ${currentIndustry} field, to attain the ${targetSkills} skill.`
                }
            }else if (type == 'subtopic'){
                if (!currentIndustry){
                    prompt = `Act as a professional syllabus maker. create a list of 5 sub titles for the title "${topicTitle}" for a syllabus pathway to attain the skills and knowledge needed to attain the ${targetSkills} skill. The subtopic should be indented and bulleted by a lowercase letters, while the main topic should retain its bulleting format which is numerical.`
                }else {
                    prompt = `Act as a professional syllabus maker. create a list of 5 sub titles for the title "${topicTitle}" for a syllabus pathway to attain the skills and knowledge needed, in the ${currentIndustry} field, to attain the ${targetSkills} skill. The subtopic should be indented and bulleted by a lowercase letters[a-z], while the main topic should retain its bulleting format which is numerical.`
                }
            }
        }
    }else if (purpose === 'Job'){
        // FIRST JOB
        if (type === 'topic'){
            if (!currentIndustry){
                prompt = `${jobDesc}
                Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge mentioned in the job description for ${jobTitle} in ${companyName}.`
            }else {
                prompt = `${jobDesc}
                Act as a professional syllabus maker. create a  numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge mentioned in the job description for ${jobTitle} in ${companyName}. Exclude from the syllabus the following skills: ${currentSkills}`
            }
        }else if (type === 'subtopic'){
            prompt = `${jobDesc}
            act as a professional syllabus maker. create a list of 5 sub titles for the title "${topicTitle}" for a syllabus pathway to attain the skills and knowledge mentioned in the job description for ${jobTitle} in ${companyName}. The subtopic should be indented and bulleted by a lowercase letters[a-z], while the main topic should retain its bulleting format which is numerical.`
        }
    }else if (purpose === 'Career'){
        // CAREER SHIFT
        if (type === 'topic'){
            if (!currentIndustry){
                prompt = `Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed to attain the skill to switch from ${currentJob} to ${jobTitle} job.`
        
            }else{
                prompt = `Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed to attain the skill to switch from ${currentJob} (${currentIndustry} field) to ${jobTitle} (${targetIndustry} field) job.`
            }
        }else if (type === 'subtopic'){
            if (!currentIndustry){
                prompt = `Act as a professional syllabus maker. create a list of 5 sub titles for the title "${topicTitle}" for a syllabus pathway to attain the skills and knowledge needed to attain the skill to switch from ${currentJob} to ${jobTitle} job. The subtopic should be indented and bulleted by a lowercase letters, while the main topic should retain its bulleting format which is numerical.`
            }else {
                prompt = `Act as a professional syllabus maker. create a list of 5 sub titles for the title "${topicTitle}" for a syllabus pathway to attain the skills and knowledge neededto attain the skill to switch from ${currentJob} (${currentIndustry} field) to ${jobTitle} (${targetIndustry} field) job.. The subtopic should be indented and bulleted by a lowercase letters[a-z], while the main topic should retain its bulleting format which is numerical.`
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

                if (comp_name) {
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

                if (comp_name) {
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
            const prompt = generatePrompt('Syllabus', 'Upskill', userInfo.targetCompany, userInfo.desiredJob, userInfo.jobDesc, 'subtopic', topic, userInfo.currentSkills, userInfo.targetSkils)
            let subtopic = await generateResponse(prompt)
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

    try{
        const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body
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
    
    const prompt = generatePrompt('Syllabus', purpose, targetCompany, desiredJob, jobDesc, 'topic', '', skillsStr, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')

    var topicsList = generatePrompt(prompt)
    topicsList = cleanList(topicsList)
    topicsList = keepBulletsNumbers(topicsList)

    const syllabus = generateSyllabus(topicsList)

    res.status(200).json(
        {
            result : syllabus
        }
    )
})


/*

MOCK INTERVIEW

*/

app.post("/questions/generate", (req, res) => {

    try{
        const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body
    }catch (error){
        res.status(400).json({
            message : "Bad request. Not all required fields were provided",
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

    const prompt = generatePrompt('Interview', purpose, targetCompany, desiredJob, jobDesc, 'questions', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')

    var questionsList = generateResponse(prompt)
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

app.post("/answers/submit", (req, res) => {

    const { answersList, questionsList } = req.body

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

    let index = 0;
    const evaluationList = [];

    for (const answers of answersList) {
        let prompt = generatePrompt('Interview', purpose, targetCompany, desiredJob, jobDesc, 'answers', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, answersList[index], questionsList[index]);
        const eval = generateResponse(prompt);

        const evaluationString = eval.data.choices.text.trim();

        evaluationList.push(evaluationString);

        index += 1;
    }

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

    const evalCopy = [...evaluationList];
    const numericValues = [];

    const evalString = evalCopy.map(String).join(', ');

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

    const averageScore = numericValues.reduce((a, b) => a + b) / numericValues.length;

    evaluationList.push(`Overall Score: ${averageScore}`);

    res.status(200).json({
        result : evaluationList
    })
})

app.post("/companies/generate", (req, res) => {

    try{

        const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body

    }catch (error){
        res.status(400).json({
            message : "Bad request. Not all required fields were provided",
            details: `${error}`
        })
    }

    try{
        currentSkills = listToString(currentSkills)
        const prompt = generatePrompt('Company', purpose, targetCompany, desiredJob, jobDesc, '', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')
        var companiesList = generateResponse(prompt)
        companiesList = cleanList(companiesList)
        companiesList = keepBulletsNumbers(companiesList)

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

app.post("/promotion/generate", (req, res) => {
    try{

        const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body

        currentSkills = listToString(currentSkills)

    }catch (error){
        res.status(400).json({
            message : "Bad request. Not all required fields were provided",
            details: `${error}`
        })
    }

    try{

        const prompt = generatePrompt('Insurance', purpose, targetCompany, desiredJob, jobDesc, 'promotion', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')
        var promotion = generateResponse(prompt)

    }catch (error){
        res.status(500).json({
            message : "An error has occurred on the server side",
            details : `${error}`
        })
    }


    res.status(200).json({
        result : promotion
    })

})

app.post("/insurance_list/generate", (req, res) => {
    try{

        const { purpose, currentIndustry, targetIndustry, desiredJob, currentJob, currentSkills, targetSkills, targetCompany, jobDesc } = req.body

        currentSkills = listToString(currentSkills)

    }catch (error){
        res.status(400).json({
            message : "Bad request. Not all required fields were provided",
            details: `${error}`
        })
    }

    try {

        const prompt = generatePrompt('Insurance', 'Upskill', targetCompany, desiredJob, jobDesc, 'list', '', currentSkills, targetSkills, currentIndustry, currentJob, targetIndustry, '', '')
        var insuranceList = generateResponse(prompt)
        insuranceList = cleanList(insuranceList)
        insuranceList = keepBulletsNumbers(insuranceList)
    
    }catch (error) {
        res.status(500).json({
            message : "An error has occurred on the server side",
            details : `${error}`
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