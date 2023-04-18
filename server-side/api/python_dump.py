def generate_prompt(section, purpose, target_company, target_job, job_desc, type, topic_title, current_skills, target_skills, current_industry, current_job, target_industry, answer, question) -> str:
    
    # SYLLABUS PROMPTS
    if section == 'Syllabus':

        # UPSKILL
        if purpose == 'Upskill':
            if type == 'topic':
                if not current_industry:
                    prompt = """Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed to attain the {} skill. Provide 2 topics for soft skills and 7 topics for hard skills.""".format(target_skills)
                
                else:
                    prompt = """Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed, in the {} field, to attain the {} skill. Provide 2 topics for soft skills and 7 topics for hard skills.""".format(current_industry, target_skills)
                
            elif type == 'subtopic':
                if not current_industry:
                    prompt = """Act as a professional syllabus maker. create a list of 5 sub titles for the title "{}" for a syllabus pathway to attain the skills and knowledge needed to attain the {} skill. The subtopic should be indented and bulleted by a lowercase letters, while the main topic should retain its bulleting format which is numerical.""".format(topic_title, target_skills)
                
                else:
                    prompt = """Act as a professional syllabus maker. create a list of 5 sub titles for the title "{}" for a syllabus pathway to attain the skills and knowledge needed, in the {} field, to attain the {} skill. The subtopic should be indented and bulleted by a lowercase letters[a-z], while the main topic should retain its bulleting format which is numerical.""".format(topic_title, current_industry, target_skills)
        
        # FIRST JOB
        elif purpose == 'Job':
            if type == 'topic':
                if not current_skills:
                    prompt = """{}
                    Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge mentioned in the job description for {} in {}. Provide 2 topics for soft skills and 7 topics for hard skills.""".format(job_desc, target_job, target_company)
                else:
                    prompt = """{}
                    Act as a professional syllabus maker. create a  numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge mentioned in the job description for {} in {}. Exclude from the syllabus the following skills: {}. Provide 2 topics for soft skills and 7 topics for hard skills.""".format(job_desc, target_job, target_company, current_skills)
                
            elif type == 'subtopic':
                prompt = """{}
                act as a professional syllabus maker. create a list of 5 sub titles for the title "{}" for a syllabus pathway to attain the skills and knowledge mentioned in the job description for {} in {}. The subtopic should be indented and bulleted by a lowercase letters[a-z], while the main topic should retain its bulleting format which is numerical.""".format(job_desc, topic_title, target_job, target_company)
        
        # CAREER SHIFT
        elif purpose == 'Career':
            if type == 'topic':
                if not current_industry:
                    prompt = """Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed to attain the skill to switch from {} to {} job. Provide 2 topics for soft skills and 7 topics for hard skills.""".format(current_job, target_job)
                
                else:
                    prompt = """Act as a professional syllabus maker. create a numerical bulleted list of titles for a syllabus pathway to attain the skills and knowledge needed to attain the skill to switch from {} ({} field) to {} ({} field) job. Provide 2 topics for soft skills and 7 topics for hard skills.""".format(current_job, current_industry, target_job, target_industry)
                
            elif type == 'subtopic':
                if not current_industry:
                    prompt = """Act as a professional syllabus maker. create a list of 5 sub titles for the title "{}" for a syllabus pathway to attain the skills and knowledge needed to attain the skill to switch from {} to {} job. The subtopic should be indented and bulleted by a lowercase letters, while the main topic should retain its bulleting format which is numerical.""".format(topic_title, current_job, target_job)
                
                else:
                    prompt = """Act as a professional syllabus maker. create a list of 5 sub titles for the title "{}" for a syllabus pathway to attain the skills and knowledge neededto attain the skill to switch from {} ({} field) to {} ({} field) job.. The subtopic should be indented and bulleted by a lowercase letters[a-z], while the main topic should retain its bulleting format which is numerical.""".format(topic_title, current_job, current_industry, target_job, target_industry)
        
        # For adding the skills, company name, and job description to the prompt if they exist
        if current_skills:
            add_prompt = """ The syllabus should exclude the following skills: {}.""".format(skills_str)
            prompt = prompt + add_prompt
            
        if target_company:
            add_prompt = """ Then, the syllabus should also for landing a job in the {} company.""".format(target_company)
            prompt = prompt + add_prompt
            
        if job_desc:
            add_prompt = """{}
            """.format(job_desc)
            
            prompt = add_prompt + prompt
            add_prompt = """ Then, the syllabus should also be focusing on the skills and knowledge needed in the job description mentioned above."""
            prompt = prompt + add_prompt
    # end of Syllabus prompts
    
    # MOCK INTERVIEW PROMPTS
    if section == 'Interview':

        # UPSKILL
        if purpose == 'Upskill':
            if type == 'questions':
                prompt = """Act like an HR Executive who is looking to hire a role in the {} inudstry that fits this skillset: {} and is interested in the following skills: {}. List down 5 behavioral question and 5 technical questions based on those information""".format(target_industry, current_skills, target_skills)
                
                if target_company:
                    add_prompt = """ Additionally, the questions should also be based on the company they are applying for: {}.""".format(target_company)
                    prompt = prompt + add_prompt
                    
                if job_desc:
                    add_prompt = """
                    {}""".format(job_desc)
                    
                    prompt = add_prompt + prompt
                    add_prompt = """ Above is the job description of the work they are applying for, take this into consideration when formulating the question."""
                    prompt = prompt + add_prompt
                
            elif type == 'answers':
                prompt = """Pretend to be a Talent Delivery Specialist that is currently interviewing to hire for a role in the {} industry and has the following skillset {}. You have asked the question: '{}', then critique this answer from the applicant: '{}' based on the following criteria - qualifications and skills, personality and work style, cultural fit, motivation and enthusiasm, potential for growth and development, and flexibility. Only give a score between 1-10 and a brief review and suggestion for the answer. Strictly follow this format when sending your response: Question: text here Answer: text here Score: ?/10 Review: review and suggestion text here. Do not give a score of 0""".format(target_industry, current_skills, question, answer)
        
        # FIRST JOB
        elif purpose == 'Job':
            if type == 'questions':
                prompt = """Act like an HR Executive in the {} industry and is interviewing a candidate to hire for the position of {}. The candidate has a skillset of: {}, take this into consideration when formulating the questions for the candidate. List down 5 behavioral question and 5 technical questions that can determine if they are fit for the role of {}""".format(target_industry, target_job, current_skills, target_job)
                
                if target_company:
                    add_prompt = """ Additionally, the questions should also be based on the company they are applying for: {}.""".format(target_company)
                    prompt = prompt + add_prompt
                    
                if job_desc:
                    add_prompt = """
                    {}""".format(job_desc)
                    
                    prompt = add_prompt + prompt
                    add_prompt = """ Above is the job description of the work they are applying for, take this into consideration when formulating the question."""
                    prompt = prompt + add_prompt
                
            elif type == 'answers':
                prompt = """Pretend to be a Talent Delivery Specialist that is currently interviewing to hire for the postion of {}. You have asked the question: '{}', then critique this answer from the applicant: '{}' based on the following criteria - qualifications and skills, personality and work style, cultural fit, motivation and enthusiasm, potential for growth and development, and flexibility. Only give a score between 1-10 and a brief review and suggestion for the answer. Strictly follow this format when sending your response: Question: text here Answer: text here Score: ?/10 Review: review and suggestion text here. Do not give an score of 0.""".format(target_job, question, answer)

        # CAREER SHIFT
        elif purpose == 'Career':
            if type == 'questions':
                prompt = """Act like an HR Executive in the {} industry and is interviewing a candidate to hire for the position of {}. The candidate previously worked in the {} industry as a {} and through that job he gained the following skills: {}. List down 5 behavioral question and 5 technical questions that can determine if they are fit for the role of {}. For the behavioral questions, include questions related on why the applicant has changed jobs or industry.""".format(target_industry, target_job, current_industry, current_job, current_skills, target_job)

                if target_company:
                    add_prompt = """ Additionally, the questions should also be based on the company they are applying for: {}.""".format(target_company)
                    prompt = prompt + add_prompt
                    
                if job_desc:
                    add_prompt = """
                    {}""".format(job_desc)
                    
                    prompt = add_prompt + prompt
                    add_prompt = """ Above is the job description of the work they are applying for, take this into consideration when formulating the question."""
                    prompt = prompt + add_prompt
            
            elif type == 'answers':
                prompt = """Pretend to be a Talent Delivery Specialist that is currently interviewing to hire for the postion of {}. You have asked the question: '{}', then critique this answer from the applicant: '{}' based on the following criteria - qualifications and skills, personality and work style, cultural fit, motivation and enthusiasm, potential for growth and development, and flexibility. Only give a score between 1-10 and a brief review and suggestion for the answer. Strictly follow this format when sending your response: Question: text here Answer: text here Score: ?/10 Review: review and suggestion text here. Do not give an score of 0.""".format(target_job, question, answer)
    # end of Mock Interview prompts
    
    # COMPANY PROMPTS
    if section == 'Company':

        # UPSKILL
        if purpose == 'Upskill':
            prompt = """Generate a list of companies suitable for beginners or those with minimal experience in {} industry who has the following skills, {}, and is also eager to learn more skills such as {}. The list should provide opportunities for growth and development within the company. Please provide at least 5 companies in the Philippines and 5 international companies that meet the criteria and a very brief description of each company or the link to the company website""".format(target_industry, current_skills, target_skills)
        
        # FIRST JOB
        elif purpose == 'Job':
            prompt = """Generate a list of companies suitable for beginners or those with minimal experience in {} industry and this is their target job, {}, and they current possess the following skills: {}. The list should provide opportunities for growth and development within the company. Please provide at least 5 companies in the Philippines and 5 international companies that meet the criteria and a very brief description of each company or the link to the company website""".format(target_industry, desired_job, current_skills)
        
        # CAREER SHIFT
        elif purpose == 'Career':
            prompt = """Generate a list of companies that a person can apply to based on the following criteria: previous industry: {}, previous job: {}, skills: {}, target industry: {}, and target job: {}. The list should only include companies that match the job the person wants, {}, and industry, {}. Prioritize companies that value and have a track record of hiring individuals with similar current job: {}, skills: {}, and industry experience: {}. Additionally, consider factors such as company culture and overall reputation. Please provide at least 5 companies in the Philippines and 5 international companies that meet the criteria, and a very brief description of each company or the link to the company website""".format(current_industry, current_job, current_skills, target_industry, desired_job, target_industry, desired_job, current_job, current_skills, current_industry)

         # For adding the company name, and job description to the prompt if they exist
 
        if target_company:
            add_prompt = """ Additionally, the person is targeting to enter this company {}, therefore, you can look for similar companies such as this one.""".format(target_company)
            prompt = prompt + add_prompt
                
        if job_desc:
            add_prompt = """{}
            """.format(job_desc)
                
            prompt = add_prompt + prompt
            add_prompt = """ The text above is the job description of the position the person is aiming for, take this into cosideration as well in adding companies into the list."""
            prompt = prompt + add_prompt
    # end of Company prompts
        
    # JOB PROMPTS
    if section == 'Job':

        # UPSKILL
        if purpose == 'Upskill':
            prompt = """Generate a list of jobs suitable for individuals who want to enter the {} industry and who are looking to enhance the following skills {}. The generated list should also take into consideration the individual's current skill set, {}. Please provide 5 job titles and a very brief description of each job that will fit the person's skills and experience. list the role and the brief description, do not include any company in the list and do not include the previous job in the list.""".format(target_industry, target_skills, current_skills)
        
        # FIRST JOB
        elif purpose == 'Job':
            prompt = """Generate a list of entry-level jobs in the {} industry that match the following criteria: Job title similar to {}, Required or wanted skills include {}. Please provide 5 job titles and a very brief description of each job that will fit the person's skills and experience. Only list the role and the brief description, do not include any company in the list and do not include the previous job in the list.""".format(target_industry, target_job, current_skills)
        
        # CAREER SHIFT
        elif purpose == 'Career':
            prompt = """Generate a list of jobs that a person can aim for based on their previous industry: {}, previous job: {}, skills: {}, target industry: {}, and target job {}. The person is looking to shift their career or move to a different job. Please provide 5 job titles and a very brief description of each job that will fit the person's skills and experience. Only list the role and the brief description, do not include any company in the list and do not include the previous job in the list.""".format(current_industry, current_job, current_skills, target_industry, desired_job)    

        if target_company:
            add_prompt = """ Additionally, the person is targeting get into this company {}, therefore, you can look for roles that is similar to the person's target job and is also known in this company.""".format(target_company)
            prompt = prompt + add_prompt
                
        if job_desc:
            add_prompt = """{}
            """.format(job_desc)
                
            prompt = add_prompt + prompt
            add_prompt = """ The text above is the job description of the position the person is aiming for, take this into cosideration as well in adding jobs into the list."""
            prompt = prompt + add_prompt
    # end of Job prompts

    # JOB PROMPTS
    if section == 'Insurance':
        if type == 'promotion':
            prompt = """Act as a professional financial advisor. Kindly provide information and promote the FWD insurance company in the philippines, metion their information the about the company and its vision and mission.Then, Create a bulleted list of the insurances, and its details, offered by FWD.Then, provide also the info on how to get an insurance in the FWD. Provide the services offered and benefits. ALso, provide the contact details of the company. Then, provide tips and tricks on how to get the best insurance plan."""
        elif type == 'list':
            prompt = """Act as a professional financial advisor. Create a numerical bulleted list of 10 insurances. Then, create also a sub bulleted list that has  5-10 company provider of that insurance, that is in the Philippines. Kindly put the FWD insurace at the top of the company list if it is in the list."""
    
    return prompt
# end of generate_prompt