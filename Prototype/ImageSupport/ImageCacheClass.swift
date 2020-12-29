//
//  ImageCacheClass.swift
//  Prototype
//
//  Created by Pierluigi Di paolo on 23/12/20.
//

/*
 
 Request to download image
 
 if let url = URL(string:"https://picsum.photos/200/300"){
     ImageCache.publicCache.load(url:url , completion: {(image) in
         if let img = image {
             self.imageView.image = img
         }
     })
 }
 
 */

import Foundation
import UIKit
public class ImageCache {
    
    public static let publicCache = ImageCache()
    var placeholderImage = UIImage(systemName: "rectangle")!
    
    private let cachedImages = NSCache<NSURL, UIImage>()
    private var loadingResponses = [URL: [(UIImage?) -> Swift.Void]]()
    
    public final func image(url: URL) -> UIImage? {
        return cachedImages.object(forKey: url as NSURL)
    }
    
    /// - Tag: cache
    // Returns the cached image if available, otherwise asynchronously loads and caches it.
    final func load(url: URL, completion: @escaping (UIImage?) -> Swift.Void) {
        // Check for a cached image.
        if let cachedImage = image(url: url) {
            DispatchQueue.main.async {
                completion(cachedImage)
            }
            return
        }
        
        // In case there are more than one requestor for the image, we append their completion block.
        if loadingResponses[url] != nil {
            loadingResponses[url]?.append(completion)
            return
        } else {
            loadingResponses[url] = [completion]
        }
        // Go fetch the image.
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url as URL) {
                guard let image = UIImage(data: data), let blocks = self?.loadingResponses[url] else {
                    DispatchQueue.main.async {
                        completion( nil)
                    }
                    return
                }
                
                // Cache the image.
                self?.cachedImages.setObject(image, forKey: url as NSURL, cost: data.count)
                            // Iterate over each requestor for the image and pass it back.
                            for block in blocks {
                                DispatchQueue.main.async {
                                    block(image)
                                }
                                return
                            }
                }
            }
        }
        
}
