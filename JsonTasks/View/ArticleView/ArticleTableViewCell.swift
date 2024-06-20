import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var articleStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        articleStack.spacing = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureArticleCell(article: Article) {
        if let imageUrl = article.urlToImage {
            articleImageView.fetchAndSetImage(from: imageUrl)
        }
        
        articleTitle.text = article.title
        articleAuthor.text = article.author
    }
    
}
