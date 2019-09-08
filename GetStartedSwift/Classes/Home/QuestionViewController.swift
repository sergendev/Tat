//
//  SoruViewController.swift
//  GetStartedSwift
//
//  Created by Sergen Gonenc on 9/6/19.
//  Copyright © 2019 MyScript. All rights reserved.
//

import UIKit
import AVKit

class QuestionViewController: UIViewController {

    var questionIndex = 0
    var questionAnswered = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataManager.shared.currentQuestion = DataManager.shared.currentTopic?.questions?.first
        
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Button actions
    
    @IBAction func next(_ sender: UIButton) {
        
        questionIndex += 1
        print(questionIndex)
        SmartThing.shared.sort(topic: DataManager.shared.currentTopic!)
        /*
        guard let nextQuestion = DataManager.shared.currentTopic?.questions?[questionIndex] else {
            DataManager.shared.currentQuestion = nextQuestion
        }
        */
        self.collectionView.reloadData()
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension QuestionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return (DataManager.shared.currentQuestion?.answerChoices.count)!
        default:
            return 5
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as? QuestionCollectionViewCell {
                
                // TurkishKit kelimesindeki büyük İ harfini kaldırmak isterdim, ama galiba örnek için biraz fazla kod olurdu :)
                
                cell.imageView.image = DataManager.shared.currentQuestion?.image
                cell.titleLabel.text = DataManager.shared.currentQuestion?.text
                return cell
            }
            
        } else {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChoiceCell", for: indexPath) as? AnswerCollectionViewCell {
                
                cell.titleLabel.text = DataManager.shared.currentQuestion?.answerChoices[indexPath.row].text
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section > 0 && !questionAnswered {
            
            let trueAnswer = DataManager.shared.currentQuestion?.answerChoices.map({$0.isCorrectAnswer})
            
            if (trueAnswer?[indexPath.row])! {
                collectionView.cellForItem(at: indexPath)?.contentView.backgroundColor = UIColor.green
                questionAnswered = true
            } else {
                collectionView.cellForItem(at: indexPath)?.contentView.backgroundColor = UIColor.red
                questionAnswered = true
            }
        }
    }
}

extension QuestionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.view.frame.width - 16.0 * 2
        let height: CGFloat
        
        switch indexPath.section {
        case 0:
            height = 334.0
        default:
            height = 44.0
        }
        
        return CGSize(width: width, height: height)
    }
}
