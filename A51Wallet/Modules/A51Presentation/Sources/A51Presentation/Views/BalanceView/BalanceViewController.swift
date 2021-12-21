import UIKit

public class BalanceViewController: UIViewController {

    @IBOutlet internal weak var headerLabel: UILabel!
    @IBOutlet internal weak var balanceLabel: UILabel!

    let viewModel: BalanceViewModelProtocol

    public init(viewModel: BalanceViewModelProtocol) {
        self.viewModel = viewModel
        super.init(
            nibName: String(describing: Self.self),
            bundle: Bundle.module)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text =  "Loading..."
        balanceLabel.text = nil
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchAccountBalance() { [weak self] error in
            guard let self = self else { return }
            guard error == nil else {
                self.showErrorAlert(message: "Failed to fetch account balance")
                return
            }
            self.headerLabel.text = self.viewModel.header
            self.balanceLabel.text = self.viewModel.balance
        }
    }
}

