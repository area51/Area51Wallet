import UIKit

public class ViewERC20ViewController: UIViewController {

    let viewModel: ViewERC20ViewModelProtocol

    public init(viewModel: ViewERC20ViewModelProtocol) {
        self.viewModel = viewModel
        super.init(
            nibName: String(describing: Self.self),
            bundle: Bundle.module)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func didTapViewERC20() {
        viewModel.handleDidTapViewERC20()
    }
}
