import UIKit

public class ETHTransferViewController: UIViewController {

    let viewModel: ETHTransferViewModelProtocol

    public init(viewModel: ETHTransferViewModelProtocol) {
        self.viewModel = viewModel
        super.init(
            nibName: String(describing: Self.self),
            bundle: Bundle.module)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func didTapSendETH() {
        viewModel.sendTokenTransfer() { [weak self] error in
            guard let error = error else {
                self?.showInfoAlert(
                    title: "Success",
                    message: "Transfer sent with success.")
                return
            }
            self?.showErrorAlert(message: "Failed to transfer.")
        }
    }
}
