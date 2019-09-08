//
//  TopicViewController.swift
//  GetStartedSwift
//
//  Created by Sergen Gonenc on 9/8/19.
//  Copyright © 2019 Memucas. All rights reserved.
//

import UIKit
import AVKit

class TopicViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    private func playVideo(skipSeconds: Double) {
        guard let path = Bundle.main.path(forResource: "video", ofType:"mov") else {
            debugPrint("video.mov not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        player.seek(to: CMTime(seconds: skipSeconds, preferredTimescale: 1))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
}

extension TopicViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCell", for: indexPath) as? HeaderCollectionReusableView {
            
            switch indexPath.row {
            case 0:
                headerCell.titleLabel.text = "Videos"
            case 1:
                headerCell.titleLabel.text = "Questions"
            default:
                break
            }
            
            return headerCell
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let topic = DataManager.shared.topics[indexPath.row]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as? TopicCollectionViewCell {
            
            switch indexPath.section {
            case 0:
                cell.imageView.image = topic.video.thumbnail
                cell.titleLabel.text = topic.video.title
            default:
                cell.imageView.image = topic.image
                cell.titleLabel.text = topic.title
            }
            
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            //2
            playVideo(skipSeconds: 297.0)
            
        default:
            performSegue(withIdentifier: "showQuestion", sender: self)
        }
    }
}
