import Foundation

class MealViewModel {
    private var meals = [Meal]()
    
    func fetchMeals(completion: @escaping () -> ()) {
        APIManager.shared.fetchData(from: Constants.mealUrl.rawValue) { (data: Meals?) in
            guard let receivedData = data else {
                print(APIError.noDataError)
                return
            }
            self.meals = receivedData.meals
            completion()
        }
    }
    
    func getMeals() -> [Meal] {
        return meals
    }
}
