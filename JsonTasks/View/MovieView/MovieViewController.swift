import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var movieTable: UITableView!
    private var movieViewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        fetchMovies()
    }
}

// MARK: data source for movie table
extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieViewModel.getMovies().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell else { fatalError("Unable to dequeue MovieTableViewCell") }
        cell.configureMovieCell(movie: movieViewModel.getMovies()[indexPath.row])
        return cell
    }
}

// MARK: setup table and fetch data
extension MovieViewController {
    func setupTable() {
        movieTable.dataSource = self
        movieTable.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    func fetchMovies() {
        movieViewModel.fetchMovies {
            DispatchQueue.main.async {
                self.movieTable.reloadData()
            }
        }
    }
}
