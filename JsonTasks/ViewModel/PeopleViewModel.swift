import Foundation

class PeopleViewModel {
    
    private var people: People?
    
    func fetchPeople(complection: @escaping () -> ()) {
        APIManager.shared.fetchData(from: Constants.peoplerUrl.rawValue) { data in
            guard let apiResponse = try? JSONDecoder().decode(People.self, from: data) else {
                print(APIError.decodingError)
                return
            }
            self.people = apiResponse
            complection()
        }
    }
    
    func getPeople() -> People? {
        return people
    }
}
