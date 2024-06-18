import Foundation

class HomeViewModel {
    private var buttonTexts = ["User", "People", "Movie", "Article", "Meal"]
    
    func getButtonTexts(_ index:Int) -> String {
        buttonTexts[index]
    }
}
