//
//  RemoteImageHelper.swift
//  FoodMood
//
//  Created by Jason Mo on 6/5/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import UIKit

//https://www.tutorialspoint.com/how-do-i-load-an-image-by-url-on-ios-device-using-swift
class RemoteImageHelper {
    func retrieveImageFromUrl(imageUrl : URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        print(imageUrl)
        URLSession.shared.dataTask(with: imageUrl, completionHandler: completionHandler).resume()
        
    }
    func retrieveImage(urlString: String?, completionHandler: @escaping (UIImage?)-> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        retrieveImageFromUrl(imageUrl: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                completionHandler(image)
            }
        }
        
    }
}

    
