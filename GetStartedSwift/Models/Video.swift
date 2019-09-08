//
//  Video.swift
//  GetStartedSwift
//
//  Created by Sergen Gonenc on 9/7/19.
//  Copyright © 2019 Memucas. All rights reserved.
//

import UIKit
import AVFoundation

struct Video {
    let title: String
    let urlString: String
    let thumbnail: UIImage
    let sections: [Tag:Double]
    
    var url: URL? {
        return URL(string: urlString)
    }
    
    func generateThumbnail(url: URL) -> UIImage? {
        do {
            let asset = AVURLAsset(url: url)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true
            // Select the right one based on which version you are using
            // Swift 4.2
            let cgImage = try imageGenerator.copyCGImage(at: .zero,
                                                         actualTime: nil)
            
            return UIImage(cgImage: cgImage)
        } catch {
            print(error.localizedDescription)
            
            return nil
        }
    }
    
}
