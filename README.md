# tagumpAI

TagumpAI is an AI-powered job readiness application that provides users with a customized syllabus based on their skills and desired job/industry. It also offers a mock interview feature to help users practice and prepare for job interviews. Additionally, the app recommends suitable companies and jobs for users to explore.

## 🗒️ Table of Contents
- [Problem Statement](#problem-statement)
- [Community](#community)
- [Proposed Solution](#proposed-solution)
- [UN SDG](#un-sdg)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Usage](#usage)
- [Demo](#demo)

## ❗ Problem Statement 

Many job seekers such as fresh graduates struggle to become job-ready due to the lack of guidance and resources in preparing for their desired careers. As a result, they often struggle to find employment or end up in positions that are not aligned with their career goals. This leads to a high turnover rate and a workforce that is not fully utilized, ultimately contributing to the global issue of unemployment and underemployment. The app, tagumpAI, aims to address this problem by providing personalized guidance to help job seekers become job-ready and find positions that are aligned with their career goals.

## 👷 Community 

- Early Career Professionals
  - individuals that are often recent graudates, working students, or those who have just started their careers  and are looking for guidance and support to advance in their chosen fields

## ✅ Proposed Solution 

The problem of job seekers struggling to become job-ready due to the lack of guidance and resources in preparing for their desired careers can be addressed through the tagumpAI app. The app provides personalized guidance to help job seekers become job-ready and find positions that are aligned with their career goals.

By providing personalized guidance, simulated interview experiences, and job and company recommendations, the tagumpAI app can help job seekers to become job-ready and find positions that are aligned with their career goals. This can ultimately contribute to reducing unemployment and underemployment rates and promote a more productive workforce.

## 🎯 UN SDG 

- SDG 8: Decent Work and Economic Growth
  - helps people become job-ready and recommends suitable jobs and companies, our app can contribute to reducing unemployment and underemployment rates, improving the quality of jobs, and promoting equal opportunities for all. Additionally, by providing customized syllabus and mock interviews, our app can help bridge the skills gap between job seekers and employers, making it easier for individuals to find decent work and contribute to the economy.
- SDG 10: Reduced Inequalities
  - providing a platform that helps increase individuals' chances of being hired, regardless of their background, providing equal opportunities for individuals who may not have access to traditional job training resources. By generating a customized syllabus based on user input and providing job and company recommendations, the app promotes inclusivity and equal opportunities for job seekers.

## 📖 Features

- Generation of user-input customized syllabus
  - generates a customized learning plan for the user based on their inputs, such as their desired job and current skill level.
- Mock interview and feedback rating
  - provides the user with a simulated interview experience. The user can practice answering interview questions and receive feedback on their performance.
- Job and company recommendation system
  - recommends jobs and companies that may be a good fit for the user based on their preferences and inputs.

## 🤖 Tech Stack

<div style = "display: inline-block">
  <b>Client-Side: </b> 
  <img src="https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white" height = "20"> </img>
  <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" height = "20"></img>
</div>

<div style = "display: inline-block">
  <b>Server-Side: </b> 
  <img src="https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E" height = "20"> </img>
  <img src="https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white" height = "20"></img>
  <img src="https://a11ybadges.com/badge?logo=openai" height = "20"></img>
</div>

## 📓 Usage

Clone the project

```bash
  git clone https://github.com/DevIsko-Hackathon/tagumpAI.git
```

Go to the project directory

```bash
  cd my-project
```

Install dependencies

```bash
  npm install
```

To run the app, follow these steps:

**OpenAI API**

Set up the OpenAI API by following these steps:
1. Go to the <u><a href="https://platform.openai.com/signup/">OpenAI API</a></u> page and sign up for an account if you don't have one yet.
2. Once you have an account, create an API key by going to the <u><a href="https://platform.openai.com/account/api-keys">API Keys</a></u> page.
3. Copy the API key and paste it into the '***API_KEY***' field in the '***constants.dart***' file located in the '***lib***' directory.

**Flutter**

1. Make sure you have Flutter installed on your machine. If you don't have Flutter installed, you can follow the <u><a href = "https://docs.flutter.dev/get-started/install">official installation guide</a></u> or watch this <u><a href = "https://www.youtube.com/watch?v=HAPQ3oUGgnE">video tutorial</a></u> to install it.

2. Open your terminal or command prompt and navigate to the project directory.

3. Run '***flutter clean***' to clean the project.

4. Run '***flutter pub***' get to download the project dependencies.

5. Finally, run '***flutter run***' to start the app.

Note: Please make sure that your device is connected to the internet while using the app, as some of its features require an active internet connection.
