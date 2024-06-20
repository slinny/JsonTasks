import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieTags: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stackView.spacing = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureMovieCell(movie: Movie) {
        movieImage.fetchAndSetImage(from: movie.screenshot.thumb)
        movieTitle.text = movie.title
        movieDuration.text = "\(movie.duration)"
        movieTags.text = movie.tags[0]
    }
}
