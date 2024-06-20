import Foundation

class MovieViewModel {
    private var movies = [Movie]()
    
    func fetchMovies(completion: @escaping () -> ()) {
        APIManager.shared.fetchData(from: Constants.movieUrl.rawValue) { data in
            guard let apiResponse = try? JSONDecoder().decode([Movie].self, from: data) else {
                print(APIError.decodingError)
                return
            }
            self.movies = apiResponse
            completion()
        }
    }
    
    func getMovies() -> [Movie] {
        self.movies
    }
}
