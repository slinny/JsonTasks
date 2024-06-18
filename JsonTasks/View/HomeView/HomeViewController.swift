import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTable: UITableView!
    private var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell else { return HomeTableViewCell() }
        cell.homeCellLabel.text = "go to \(homeViewModel.getButtonTexts(indexPath.row))"
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var nextViewController: UIViewController?
        switch indexPath.row {
        case 0:
            nextViewController = storyboard.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        case 1:
            nextViewController = storyboard.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        case 2:
            nextViewController = storyboard.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        case 3:
            nextViewController = storyboard.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        case 4:
            nextViewController = storyboard.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        default:
            nextViewController = nil
        }
        if let nextViewController = nextViewController {
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}

extension HomeViewController {
    fileprivate func setupTable() {
        homeTable.dataSource = self
        homeTable.delegate = self
        homeTable.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
}


