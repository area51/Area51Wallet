import Foundation
import web3
import BigInt
@testable import A51Services

class EthereumClientSpy: EthereumClientService {

    var eth_getBalance_balance: BigUInt?
    var eth_getBalance_error: EthereumClientError?
    var eth_getBalance_callCount: Int = 0

    func eth_getBalance(
        address: EthereumAddress,
        block: EthereumBlock,
        completion: @escaping ((EthereumClientError?, BigUInt?) -> Void)
    ) {

        eth_getBalance_callCount += 1
        
        completion(
            eth_getBalance_error,
            eth_getBalance_balance)
    }

    var eth_sendRawTransaction_hash: String?
    var eth_sendRawTransaction_error: EthereumClientError?
    var eth_sendRawTransaction_callCount: Int = 0

    func eth_sendRawTransaction(
        _ transaction: EthereumTransaction,
        withAccount account: EthereumAccountProtocol,
        completion: @escaping ((EthereumClientError?, String?) -> Void))
    {

        eth_sendRawTransaction_callCount += 1

        completion(
            eth_sendRawTransaction_error,
            eth_sendRawTransaction_hash)
    }

    var eth_getLogs_logs: [EthereumLog]?
    var eth_getLogs_error: EthereumClientError?
    var eth_getLogs_callCount: Int = 0

    func eth_getLogs(
        addresses: [EthereumAddress]?,
        orTopics: [[String]?]?,
        fromBlock: EthereumBlock,
        toBlock: EthereumBlock,
        completion: @escaping ((EthereumClientError?, [EthereumLog]?) -> Void)
    ){
        eth_getLogs_callCount += 1

        completion(
            eth_getLogs_error,
            eth_getLogs_logs)
    }

    var eth_getTransaction_tx: EthereumTransaction?
    var eth_getTransaction_error: EthereumClientError?
    var eth_getTransaction_callCount: Int = 0

    func eth_getTransaction(
        byHash txHash: String,
        completion: @escaping ((EthereumClientError?, EthereumTransaction?) -> Void)
    ){
        eth_getTransaction_callCount += 1
        
        completion(
            eth_getTransaction_error,
            eth_getTransaction_tx)
    }
}
