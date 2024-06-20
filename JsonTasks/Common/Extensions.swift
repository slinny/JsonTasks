import Foundation
import UIKit

extension UIImageView {
    func fetchAndSetImage(from url: String) {
        APIManager.shared.fetchData(from: url) { data in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}
