import UIKit

public class MainViewController: UIViewController {

    @IBOutlet private weak var stackView: UIStackView!

    public init() {
        super.init(
            nibName: String(describing: Self.self),
            bundle: Bundle.module)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addChildViewControllersToStackView(
        _ childs: [UIViewController]) {

        loadViewIfNeeded()
        childs.forEach { childViewController in
            addChild(childViewController)
            stackView.addArrangedSubview(childViewController.view)
            childViewController.didMove(toParent: self)
        }
    }
}
