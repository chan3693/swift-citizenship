//
//  Quiz.swift
//  SheungKit_Citizenship
//
//  Created by Simon Chan on 2024-05-21.
//

import Foundation

class Quiz {
    
    var questionByCategory: [String: [Questions]]
    var passingScore: [String: Int]
    init(questionByCategory: [String : [Questions]], passingScore: [String : Int]) {
        self.questionByCategory = questionByCategory
        self.passingScore = passingScore
    }
    
    var historyScore = 0
    var politicsScore = 0
    var cultureScore = 0
    func start() {
        print("Welcome to Canadian Citizenship Practice Tests 2024")
        print("\nImmigrants who want to obtain Canadian citizenship must pass a knowledge-based quiz about Canadian history, politics, and culture. The mock test consists of 9 questions divided into 3 categories: History, Politics, Culture.")
        print("\nThe quiz is evaluated at the end of each category. For example, at the end of the History category, the application should check if the user has met the passing criteria for the History category (1 out of 3 questions). If yes, then proceed with questions from Canadian Politics. If not, then notify the user that they failed, and end the quiz.")
    
        do {
            var firstIndex = 1
            for category in ["History", "Politics", "Culture"] {
                print("\n ----- \(category) ----- ")
                guard let question = questionByCategory[category], let passingScore = passingScore[category] else {
                    break
                }
                
                if try askQuestion(questions: question, passingScore: passingScore, firstIndex: firstIndex, category: category) {
                    if category == "History" || category == "Politics"{
                        continue
                    }
                } else {
                    print("\nYou failed the Test!")
                    break
                }
                firstIndex += question.count
                print("\nFinal Result")
                print("History Score: \(historyScore) out of \(questionByCategory.count)")
                print("Politics Score: \(politicsScore) out of \(questionByCategory.count)")
                print("Culture Score: \(cultureScore) out of \(questionByCategory.count)")
                print("You passed the Test!")
            }
        
        } catch QuizError.InvalidInput {
            print("Error: Invalid input")
        } catch {
            print("System Error")
        }
        
    }
    
    func askQuestion(questions:[Questions], passingScore: Int, firstIndex: Int, category: String) throws -> Bool {
        var score = 0
        for (i, question) in questions.enumerated(){
            print("\nQuestion \(i + firstIndex) out of 9 : \(question.question)") //print question
            for option in question.option{
                print("\(option)") //print option
            }
            print("Selet the answer (a or b): ", terminator: "")
            if let answer = readLine(), answer.lowercased() == "a" || answer.lowercased() == "b"{
                question.inputAnswer = answer.lowercased()
                if question.isCorrect(){
                    score += 1
                }
            } else {
                throw QuizError.InvalidInput
            }
        }

        if category == "History" {
            print("\n\(category) Score: \(score) out of \(questions.count)")
            print("\(category) passed")
            historyScore = score
        } else if category == "Politics" {
            print("\n\(category) Score: \(score) out of \(questions.count)")
            print("\(category) passed")
            politicsScore = score
        } else if category == "Culture" {
            cultureScore = score
        }
        return score >= passingScore
        
    }
}
