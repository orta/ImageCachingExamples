import UIKit

extension UIImage {
    // creates a 1x1 UIImage with a color and caches it
    // derived from http://stackoverflow.com/questions/2808888/is-it-even-possible-to-change-a-uibuttons-background-color
    // and https://github.com/artsy/eigen/blob/master/Artsy/Categories/Apple/UIImage+ImageFromColor.m

    @nonobjc static var colorImageCache: NSCache!

    struct StaticDispatch {
        @nonobjc static var dispatchOnceToken: dispatch_once_t = 0
    }

    /// A cached generator of 1x1 coloured images
    class func imageWithColor(color:UIColor) -> UIImage {
        dispatch_once(&StaticDispatch.dispatchOnceToken) {
            colorImageCache = NSCache()
        }

        // Do we have it cached?
        let imageMaybe = colorImageCache.objectForKey(color)
        if let image = imageMaybe as? UIImage {
            return image
        }

        // Generate a 1x1 from the cache
        let image = imageFromColor(color, size: CGSize(width: 1, height: 1))
        colorImageCache.setObject(image, forKey: color)
        return image
    }

    /// A generator of coloured images with the size of your choosing
    /// useful when an UIImageView's intrinsic content is important in layout
    private class func imageFromColor(color: UIColor, size: CGSize) -> UIImage {
        let sizeRect = CGRect(origin: CGPointZero, size: size)
        UIGraphicsBeginImageContext(size)

        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, sizeRect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
