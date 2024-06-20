import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userTable: UITableView!
    private var userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        fetchUsers()
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userViewModel.getUsers().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell else { fatalError("Unable to dequeue UserTableViewCell") }
        cell.setupTableCellData(user: userViewModel.getUsers()[indexPath.row])
        return cell
    }
}

extension UserViewController {
    private func setupTable() {
        userTable.dataSource = self
        userTable.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
    
    private func fetchUsers() {
        userViewModel.fetchUsers {
            DispatchQueue.main.async {
                self.userTable.reloadData()
            }
        }
    }
}

