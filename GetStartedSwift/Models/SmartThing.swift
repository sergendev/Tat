//
//  SmartThing.swift
//  GetStartedSwift
//
//  Created by Sergen Gonenc on 9/7/19.
//  Copyright © 2019 Memucas. All rights reserved.
//

import Foundation

class SmartThing {
    
    static let shared = SmartThing()
    
    private var tagsWithMistakes = [Tag]()
    
    class func addTag(tag: Tag) {
        shared.tagsWithMistakes.append(tag)
    }
    
    func sort(topic: Topic) {
        
        var tempTopic = topic
        
        for (index, question) in tempTopic.questions!.enumerated() {
            
            if (question.tags?.contains(where: tagsWithMistakes.contains))! {
                print("Array 1 and array 2 share at least one common element")
                
                let element = (tempTopic.questions?.remove(at: index))!
                tempTopic.questions?.insert(element, at: 0)
                
                print(question.tags as Any)
                print(tempTopic.questions!)
            } else {
                print("Array 1 doesn't contains any elements from array 2")
            }
            
        }
    }
    
}
