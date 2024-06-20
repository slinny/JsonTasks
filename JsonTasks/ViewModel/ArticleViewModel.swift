import Foundation

class ArticleViewModel {    
    private var articles = [Article]()
    
    func fetchArticles(completion: @escaping () -> ()) {
        APIManager.shared.fetchData(from: Constants.articleUrl.rawValue) { (data: Articles?) in
            guard let receivedData = data else {
                print(APIError.noDataError)
                return
            }
            self.articles = receivedData.articles
            completion()
        }
    }
    
    func getArticles() -> [Article] {
        self.articles
    }
}
