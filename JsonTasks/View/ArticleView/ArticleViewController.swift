import UIKit

class ArticleViewController: UIViewController {
    
    @IBOutlet weak var articleTable: UITableView!
    private var articleViewModel = ArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        fetchArticles()
    }
}

extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleViewModel.getArticles().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = articleTable.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as? ArticleTableViewCell else {
            fatalError("Unable to dequeue ArticleTableViewCell")
        }
        cell.configureArticleCell(article: articleViewModel.getArticles()[indexPath.row])
        return cell
    }
}

extension ArticleViewController {
    func setupTable() {
        articleTable.dataSource = self
        articleTable.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        articleTable.rowHeight = 60
    }
    
    func fetchArticles() {
        articleViewModel.fetchArticles {
            DispatchQueue.main.async {
                self.articleTable.reloadData()
            }
        }
    }
}
