import Foundation

class UserViewModel {
    
    private var users = [User]()
    
    func fetchUsers(completion: @escaping () -> ()) {
        APIManager.shared.fetchData(from: Constants.userUrl.rawValue) { data in
            guard let apiResponse = try? JSONDecoder().decode([User].self, from: data) else {
                print(APIError.decodingError)
                return
            }
            self.users = apiResponse
            completion()
        }
    }
    
    func getUsers() -> [User] {
        return users
    }
}
