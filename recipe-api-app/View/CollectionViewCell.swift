import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipeImg.layer.cornerRadius = 15
    }

}
