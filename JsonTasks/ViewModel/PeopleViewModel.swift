import Foundation

class PeopleViewModel {
    
    private var people: People?
    
    func fetchPeople(complection: @escaping () -> ()) {
        APIManager.shared.fetchData(from: Constants.peoplerUrl.rawValue) { (data: People?) in
            guard let receivedData = data else {
                print(APIError.noDataError)
                return
            }
            
            self.people = receivedData
            complection()
        }
    }
    
    func getPeople() -> People? {
        return people
    }
}
