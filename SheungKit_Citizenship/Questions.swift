//
//  Questions.swift
//  SheungKit_Citizenship
//
//  Created by Simon Chan on 2024-05-21.
//

import Foundation

class Questions: Question {
    var question: String
    var option: [String]
    var Answer: String
    
    init(question: String, option: [String], Answer: String) {
        self.question = question
        self.option = option
        self.Answer = Answer
    }
    
    var inputAnswer: String? = nil
    func isCorrect() -> Bool {
        return inputAnswer == Answer
    }
}


