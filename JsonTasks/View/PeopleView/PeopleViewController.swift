import UIKit

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    private var peopleViewModel = PeopleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPeople()
    }
    
    fileprivate func fetchPeople() {
        peopleViewModel.fetchPeople {
            guard self.peopleViewModel.getPeople() != nil else {
                print(APIError.noDataError)
                return
            }
            DispatchQueue.main.async {
                self.nameLabel.text = "name: \(self.peopleViewModel.getPeople()!.name)"
                self.heightLabel.text = "height: \(self.peopleViewModel.getPeople()!.height)"
                self.genderLabel.text = "gender: \(self.peopleViewModel.getPeople()!.gender)"
            }
        }
    }
}
