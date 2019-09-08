//
//  MainViewController.swift
//  GetStartedSwift
//
//  Created by Sergen Gonenc on 9/7/19.
//  Copyright © 2019 Memucas. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        SmartThing.addTag(tag: "Operations")
        SmartThing.shared.sort(topic: DataManager.shared.topics.first!)
    }
    
    var row = 0

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.shared.topics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let topic = DataManager.shared.topics[indexPath.row]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? TKCollectionViewCell {
            
            cell.imageView.image = topic.image
            cell.titleLabel.text = topic.title
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DataManager.shared.currentTopic = DataManager.shared.topics[indexPath.row]
        performSegue(withIdentifier: "subTopic", sender: self)
    }
}

