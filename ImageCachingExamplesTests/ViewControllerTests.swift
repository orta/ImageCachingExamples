import Quick
import Nimble
import Nimble_Snapshots
import SDWebImage
import UIKit

@testable
import ImageCachingExamples

/// Takes an address, and a colour and caches it for synchronous testing
func cacheColoredImageForURL(string: String, color: UIColor) {
    let image = UIImage.imageWithColor(color)
    SDWebImageManager.sharedManager().saveImageToCache(image, forURL:NSURL(string: string)!)
}

class ViewControllerTests: QuickSpec {
    override func spec() {
        var subject: ViewController!

        beforeEach {
            // This sort of thing can be made more elegant with
            // https://github.com/AliSoftware/SwiftGen

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            subject = storyboard.instantiateInitialViewController() as! ViewController

            // Use our coloured images in the SDWebCache
            cacheColoredImageForURL(subject.imageOneAddress, color: UIColor.greenColor())
            cacheColoredImageForURL(subject.imageTwoAddress, color: UIColor.blueColor())
            cacheColoredImageForURL(subject.imageThreeAddress, color: UIColor.redColor())
        }

        it("looks right") {
            // Simple snapshot test, to record I did:
            // expect(subject) == recordSnapshot()

            expect(subject) == snapshot()
        }
    }
}
