import Foundation

class MovieViewModel {
    private var movies = [Movie]()
    
    func fetchMovies(completion: @escaping () -> ()) {
        APIManager.shared.fetchData(from: Constants.movieUrl.rawValue) { (data: [Movie]?) in
            guard let receivedData = data else {
                print(APIError.noDataError)
                return
            }
            
            self.movies = receivedData
            completion()
        }
    }
    
    func getMovies() -> [Movie] {
        self.movies
    }
}
