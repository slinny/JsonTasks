import Foundation

class MealViewModel {
    private var meals = [Meal]()
    
    func fetchMeals(completion: @escaping () -> ()) {
        APIManager.shared.fetchData(from: Constants.mealUrl.rawValue) { data in
            guard let apiResponse = try? JSONDecoder().decode(Meals.self, from: data) else {
                print(APIError.decodingError)
                return
            }
            self.meals = apiResponse.meals
            completion()
        }
    }
    
    func getMeals() -> [Meal] {
        return meals
    }
}
