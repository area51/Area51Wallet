import Foundation
import web3

public protocol FetchERC20TransfersService {
    func fetchTransfers() async throws -> [EthereumTransaction]
}
