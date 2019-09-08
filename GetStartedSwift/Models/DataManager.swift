//
//  DataManager.swift
//  GetStartedSwift
//
//  Created by Sergen Gonenc on 9/7/19.
//  Copyright © 2019 Memucas. All rights reserved.
//

import Foundation

class DataManager {
    
    // MARK: - Properties
    static let shared = DataManager()
    
    var currentTopic: Topic?
    var currentQuestion: Question?
    
    private lazy var step = [Step(expression: "\\int ^{a}_{0}x^{2}dx=9", tag: "Area"), Step(expression: "\\dfrac {x^{3}}{3}\right| ^{a}_{0}=9", tag: "Solving"), Step(expression: "\\dfrac {a^{3}}{3}=9", tag: "Operations"), Step(expression: "a=3", tag: "Operations")]
    private lazy var answerChoice = [AnswerChoice(text: "1", isCorrectAnswer: false), AnswerChoice(text: "3", isCorrectAnswer: true), AnswerChoice(text: "5", isCorrectAnswer: false), AnswerChoice(text: "7", isCorrectAnswer: false)]
    private lazy var question = [Question(image: #imageLiteral(resourceName: "Integral Question"), text: "If the grey area equals 9 br^2, what is the value of a?", answerChoices: answerChoice, steps: step)]
    private lazy var video = Video(title: "Area with Integration", urlString: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8", thumbnail:#imageLiteral(resourceName: "TAT İntegral2"), sections: ["Solving":12.76])
    
    lazy var topics = [Topic(image: #imageLiteral(resourceName: "TAT İntegral2"), title: "Integration", questions: question, video: video)]
    
    // MARK: - Functions
    
    // MARK: - Life Cycle
    
}
