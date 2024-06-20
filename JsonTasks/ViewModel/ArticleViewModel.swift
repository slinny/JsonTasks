import Foundation

class ArticleViewModel {    
    private var articles = [Article]()
    
    func fetchArticles(completion: @escaping () -> ()) {
        APIManager.shared.fetchData(from: Constants.articleUrl.rawValue) { data in
            guard let apiResponse = try? JSONDecoder().decode(Articles.self, from: data) else {
                print(APIError.decodingError)
                return
            }
            self.articles = apiResponse.articles
            completion()
        }
    }
    
    func getArticles() -> [Article] {
        self.articles
    }
}
