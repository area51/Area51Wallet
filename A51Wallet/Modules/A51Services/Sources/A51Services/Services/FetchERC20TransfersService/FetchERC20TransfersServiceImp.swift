import web3
import UIKit

public class FetchERC20TransfersServiceImp: FetchERC20TransfersService {
    internal let etherClient: EthereumClientService
    internal let walletAddress: EthereumAddress

    public init(
        etherClient: EthereumClientService,
        walletAddress: String
    ){
        self.etherClient = etherClient
        self.walletAddress = EthereumAddress(walletAddress)
    }

    public func fetchTransfers() async throws -> [EthereumTransaction] {
        var transactions: [EthereumTransaction] = []

        let hashes = try await fetchEthereumLogs()
            .compactMap { $0.transactionHash }

        for hash in hashes {
            let tx = try await getTransaction(hash)
            transactions.append(tx)
        }

        return transactions
    }
}

// MARK: - Helpers

extension FetchERC20TransfersServiceImp {

    private
    func fetchEthereumLogs() async throws -> [EthereumLog] {
        try await withCheckedThrowingContinuation { continuation in
            etherClient.eth_getLogs(addresses: [walletAddress], orTopics: nil)
            { error, logs in

                guard let logs = logs else {
                    let err = error ?? EthereumClientError.unexpectedReturnValue
                    return continuation.resume(throwing: err)
                }
                continuation.resume(returning: logs)
            }
        }
    }

    private
    func getTransaction(_ hash: String) async throws -> EthereumTransaction {
        try await withCheckedThrowingContinuation { continuation in
            etherClient.eth_getTransaction(byHash: hash) { error, transaction in
                if let transaction = transaction {
                    return continuation.resume(returning: transaction)
                }
                continuation.resume(
                    throwing: error ?? EthereumClientError.noResultFound)
            }
        }
    }
}
