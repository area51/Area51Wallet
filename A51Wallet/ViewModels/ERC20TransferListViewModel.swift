//
//  A51Wallet
//

import Foundation
import A51Presentation
import A51Services
import web3

class ERC20TransferListViewModel: ERC20TransferListViewModelProtocol {
    var title: String? = "ERC20 Transfers"
    private(set) var transfers: [TransferInfo] = []

    private let fetchService: FetchERC20TransfersService

    init(service: FetchERC20TransfersService) {
        self.fetchService = service
    }

    func fetchTransfers(
        completion: @escaping (Result<[TransferInfo], Error>) -> Void
    ){
        Task {
            do {
                let transfers = try await fetchService.fetchTransfers()
                let txInfo = transfers.compactMap { tx -> TransferInfo? in
                    // Remove non value transfers
                    guard let amount = tx.value, amount > 0 else { return nil }
                    return TransferInfoAdapter.ethTransferInfo(from: tx)
                }
                self.transfers = txInfo
                completeOnMainThread {
                    completion(.success(txInfo))
                }
            } catch (let error) {
                completeOnMainThread {
                    completion(.failure(error))
                }
            }
        }
    }
}
