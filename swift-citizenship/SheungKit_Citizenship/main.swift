//
//  main.swift
//  SheungKit_Citizenship
//
//  Created by Simon Chan on 2024-05-21.
//

import Foundation

let historyQuestions = [
    Questions(question: "Who proclaimed the amended constitution of Canada in 1982?", option: ["a. Queen Victoria", "*b. Queen Elizabeth II"], Answer: "b"),
    Questions(question: "When was the Constitution of Canada amended to entrench the 'Canadian Charter of Rights and Freedoms'?", option: ["a. 1992", "*b. 1982"], Answer: "b"),
    Questions(question: "Who are the three founding peoples of Canada?", option: ["a. Aboriginal, Australians and French", "*b. Aboriginal, French and British"], Answer: "b")
]

let politicsQuestions = [
    Questions(question: "When does the election count start?", option: ["*a. Immediately after the polling stations close", "b. After 7 days"], Answer: "a"),
    Questions(question: "Who is responsible for conducting federal elections and referendums?", option: ["*a. Elections Canada", "b. Elections Office"], Answer: "a"),
    Questions(question: "Electoral districts are also known as", option: ["a. States or Cities", "*b. Ridings or constituencies"], Answer: "b")
]

let cultureQuestions = [
    Questions(question: "In which province more than three-quarters speak French as their first language", option: ["a. Nova Scotia", "*b. Quebec"], Answer: "b"),
    Questions(question: "Whose films have been popular in Quebec and across the country and won international awards?", option: ["a. Denise Robert", "*b. Denys Arcand"], Answer: "b"),
    Questions(question: "Which province one-third of the population lives and works in French.", option: ["*a. New Brunswick", "b. Newfoundland and Labrador"], Answer: "a")
]

let questionByCategory: [String: [Questions]] = [
    "History": historyQuestions,
    "Politics": politicsQuestions,
    "Culture": cultureQuestions
]

let passingScore: [String: Int] = [
    "History": 1, //A minimum of 33% in the Canadian History category (1 out of 3 questions)
    "Politics": 2, //A minimum of 66.67% in the Canadian Politics category (2 out of 3 questions)
    "Culture": 3 //100% on the Canadian Culture category (all 3 questions)
]

let quiz = Quiz(questionByCategory: questionByCategory, passingScore: passingScore)
quiz.start()
