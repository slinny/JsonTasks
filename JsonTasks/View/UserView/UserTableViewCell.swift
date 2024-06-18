import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    
    private var index = 0
    private var userViewModel = UserViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UserTableViewCell {
    func setIndex(index: Int) {
        self.index = index
    }
    
    func updateView() {
        name.text = "name: \(userViewModel.getUsers()[index].name)"
        username.text = "username: \(userViewModel.getUsers()[index].username)"
        email.text = "email: \(userViewModel.getUsers()[index].email)"
    }
}
