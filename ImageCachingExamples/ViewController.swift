import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var primaryImageView: UIImageView!
    @IBOutlet weak var secondaryImageView: UIImageView!
    @IBOutlet weak var tertiaryImageView: UIImageView!

    let imageOneAddress = "https://www.artsy.net/artwork/praxiteles-aphrodite-of-knidos-greco-roman-variant-on-the-original-marble-of-ca-350-bc/download/praxiteles-aphrodite-of-knidos-greco-roman-variant-on-the-original-marble-of-ca-350-b-c.jpg"
    let imageTwoAddress = "https://www.artsy.net/artwork/auguste-rodin-victor-hugo-de-trois-quarts-1/download/auguste-rodin-victor-hugo-de-trois-quarts-1884.jpg"
    let imageThreeAddress = "https://www.artsy.net/artwork/auguste-rodin-the-gates-of-hell-detail-the-thinker/download/auguste-rodin-the-gates-of-hell-detail-the-thinker-1902.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Take the addresses and set the imageview's images asycnhronously
        primaryImageView.or_setImageWithURL(NSURL(string:imageOneAddress)!)
        secondaryImageView.or_setImageWithURL(NSURL(string:imageTwoAddress)!)
        tertiaryImageView.or_setImageWithURL(NSURL(string:imageThreeAddress)!)
    }
}
