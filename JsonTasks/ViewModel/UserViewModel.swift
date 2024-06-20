import Foundation

class UserViewModel {
    
    private var users = [User]()
    
    func fetchUsers(completion: @escaping () -> ()) {
        APIManager.shared.fetchData(from: Constants.userUrl.rawValue) { (data: [User]?) in
            guard let receivdData = data else {
                print(APIError.noDataError)
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
