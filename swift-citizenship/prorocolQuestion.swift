//
//  prorocolQuestion.swift
//  SheungKit_Citizenship
//
//  Created by Simon Chan on 2024-05-21.
//

import Foundation

protocol Question {
    var question: String { get }
    var option: [String] { get }
    var Answer: String { get }
    var inputAnswer: String? { get set }
    func isCorrect() -> Bool
}
