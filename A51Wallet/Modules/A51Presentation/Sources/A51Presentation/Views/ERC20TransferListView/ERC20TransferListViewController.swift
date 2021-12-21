import UIKit

public class ERC20TransferListViewController: UITableViewController {

    internal let viewModel: ERC20TransferListViewModelProtocol
    internal let reuseIdentifier = String(describing: TransferInfoCell.self)

    public init(viewModel: ERC20TransferListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        setupTableView(tableView)
    }

    private func setupTableView(_ tableView: UITableView) {
        tableView.rowHeight = 90.0
        let nib = UINib(
            nibName: String(describing: TransferInfoCell.self),
            bundle: Bundle.module)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchTransfers{ [weak self] result in
            switch result {
            case .success:
                self?.tableView.reloadData()
            case .failure:
                self?.showErrorAlert(message: "Failed to fetch transactions")
            }
        }
    }

    // MARK: - Table view data source

    public override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int
    {
        viewModel.transfers.count
    }

    public override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath) as? TransferInfoCell
        else {
            return UITableViewCell()
        }

        let item = viewModel.transfers[indexPath.row]
        cell.senderLabel.text = item.sender
        cell.tokenLabel.text = item.token
        cell.amountLabel.text = item.amount
        return cell
    }
}
