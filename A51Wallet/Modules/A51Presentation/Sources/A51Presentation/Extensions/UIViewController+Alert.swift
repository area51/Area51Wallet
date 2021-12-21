import UIKit

public extension UIViewController {
    func showAlert(
        title: String,
        message: String,
        actions: [UIAlertAction]
    ){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        present(alert, animated: true)
    }

    func showInfoAlert(title: String, message: String) {
        let actions = [
            UIAlertAction(title: "OK", style: .default)
        ]
        showAlert(title: title, message: message, actions: actions)
    }

    func showErrorAlert(message: String) {
        let actions = [
            UIAlertAction(title: "OK", style: .default)
        ]
        showAlert(title: "Error", message: message, actions: actions)
    }
}
