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
//        movieImage.fetchAndSetImage(from: movie.screenshot.thumb)
        movieImage.fetchAndSetImage(from: "https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/7a/bd/c0/7abdc0c7-787f-bfa0-b0b8-a844b125040f/111119293129.jpg/60x60bb.jpg")
        movieTitle.text = movie.title
        movieDuration.text = "\(movie.duration)"
        movieTags.text = movie.tags[0]
    }
}
