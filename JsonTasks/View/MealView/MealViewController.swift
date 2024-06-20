import UIKit

class MealViewController: UIViewController {
    
    @IBOutlet weak var mealTable: UITableView!
    private var mealViewModel = MealViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        fetchMeals()
    }
}

extension MealViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mealViewModel.getMeals().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mealTable.dequeueReusableCell(withIdentifier: "MealTableViewCell") as? MealTableViewCell else { fatalError("Unable to dequeue MealTableViewCell") }
        cell.configureMealCell(meal: mealViewModel.getMeals()[indexPath.row])
        return cell
    }
}

extension MealViewController {
    func setupTable() {
        mealTable.dataSource = self
        mealTable.register(UINib(nibName: "MealTableViewCell", bundle: nil), forCellReuseIdentifier: "MealTableViewCell")
    }
    
    func fetchMeals() {
        mealViewModel.fetchMeals {
            DispatchQueue.main.async {
                self.mealTable.reloadData()
            }
        }
    }
}
