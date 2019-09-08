//
//  Question.swift
//  GetStartedSwift
//
//  Created by Sergen Gonenc on 9/6/19.
//  Copyright © 2019 MyScript. All rights reserved.
//

import Foundation

struct Question {
    let image: UIImage
    let text: String
    let answerChoices: [AnswerChoice]
    let steps: [Step]?
    
    var tags: Set<Tag>? {
        return Set((steps?.map({$0.tag}))!)
    }
}
