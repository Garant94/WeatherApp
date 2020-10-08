import Foundation
import UIKit

protocol AlertHandler {
    func showSimpleAlert(title: String, message: String)
}

extension AlertHandler where Self: UIViewController {
    func showSimpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
