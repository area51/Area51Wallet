//
//  A51WalletTests
//

import Foundation
import A51Services
import BigInt
import web3
@testable import A51Wallet

class EthereumClientStub: EthereumClientService {

    var eth_getBalance_balance: BigUInt?
    var eth_getBalance_error: EthereumClientError?

    func eth_getBalance(
        address: EthereumAddress,
        block: EthereumBlock,
        completion: @escaping ((EthereumClientError?, BigUInt?) -> Void)
    ){
        completion(
            eth_getBalance_error,
            eth_getBalance_balance)
    }

    var eth_sendRawTransaction_hash: String?
    var eth_sendRawTransaction_error: EthereumClientError?

    func eth_sendRawTransaction(
        _ transaction: EthereumTransaction,
        withAccount account: EthereumAccountProtocol,
        completion: @escaping ((EthereumClientError?, String?) -> Void)
    ){
        completion(
            eth_sendRawTransaction_error,
            eth_sendRawTransaction_hash)

    }

    var eth_getLogs_logs: [EthereumLog]?
    var eth_getLogs_error: EthereumClientError?

    func eth_getLogs(
        addresses: [EthereumAddress]?,
        orTopics: [[String]?]?,
        fromBlock: EthereumBlock,
        toBlock: EthereumBlock,
        completion: @escaping ((EthereumClientError?, [EthereumLog]?) -> Void)
    ){
        completion(
            eth_getLogs_error,
            eth_getLogs_logs)
    }

    var eth_getTransaction_tx: EthereumTransaction?
    var eth_getTransaction_error: EthereumClientError?

    func eth_getTransaction(
        byHash txHash: String,
        completion: @escaping ((EthereumClientError?, EthereumTransaction?) -> Void)
    ){
        completion(
            eth_getTransaction_error,
            eth_getTransaction_tx)
    }
}
