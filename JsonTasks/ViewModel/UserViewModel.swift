import Foundation

class UserViewModel {
    
    private var users = [User]()
    
    func fetchData(completion: @escaping () -> ()) {
        APIManager.shared.fetchData(from: Constants.URL.rawValue) { (data: [User]?) in
            guard let receivdData = data else {
                return
            }
            
            self.users = receivdData
            completion()
        }
    }
    
    func getUsers() -> [User] {
        return users
    }
}
