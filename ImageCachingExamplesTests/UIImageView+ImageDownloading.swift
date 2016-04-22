import UIKit
import SDWebImage

extension UIImageView {

    func or_setImageWithURL(url: NSURL) {

        // Set a coloured background while it loads
        if (image == nil) {
            image = UIImage.imageWithColor(.lightGrayColor())
        }

        // Pass directly to SDWebImage if not in testing environment
        guard NSClassFromString("XCTest") != nil else {
            sd_setImageWithURL(url)
            return
        }

        // Look inside the SD Image Cache to see if our URL has already been stored
        let imageManager = SDWebImageManager.sharedManager()
        let key = imageManager.cacheKeyForURL(url)

        // If not, provide a useful error message, or optionally raise an exception
        guard let cachedImage = imageManager.imageCache.imageFromMemoryCacheForKey(key) else {
            print("Detected a un-stubbed image request for URL: \(url)")
            sd_setImageWithURL(url)
            return
        }

        // Synchronously set the cached image
        image = cachedImage
    }
}
