import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealCuisine: UILabel!
    @IBOutlet weak var mealStack: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mealStack.spacing = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureMealCell(meal: Meal) {
        if let imageUrl = meal.strMealThumb {
            mealImageView.fetchAndSetImage(from: imageUrl)
        }
        mealName.text = meal.strMeal
        mealCuisine.text = meal.strArea
    }
}
