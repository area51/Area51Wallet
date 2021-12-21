//
//  A51Wallet
//

import Foundation
import A51Presentation
import A51Services
import BigInt

class BalanceViewModel: BalanceViewModelProtocol {

    var header: String = "Wallet Balance"
    var balance: String = "Loading..."
    var fetchBalanceService: FetchBalanceService
    var account: String

    init(service: FetchBalanceService, account: String) {
        self.fetchBalanceService = service
        self.account = account
    }

    func amountToFormattedBalance(_ amount: BigUInt) -> String {
        let ethAmount = Double(amount.weiToGwei) / 1.0e9
        return String(format: "%.2f ETH", ethAmount)
    }

    func fetchAccountBalance(completion: @escaping FetchAccountBalanceResponse) {
        fetchBalanceService
            .fetchBalance(ofAccount: account) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let amount):
                    self.balance = self.amountToFormattedBalance(amount)
                    completeOnMainThread { completion(nil) }
                case .failure(let error):
                    completeOnMainThread { completion(error) }
                }
            }
    }
}
