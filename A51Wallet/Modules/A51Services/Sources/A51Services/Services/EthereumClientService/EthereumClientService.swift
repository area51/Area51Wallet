import Foundation
import web3
import BigInt

public protocol EthereumClientService {
    func eth_getBalance(
        address: EthereumAddress,
        block: EthereumBlock,
        completion: @escaping((EthereumClientError?, BigUInt?) -> Void))

    func eth_sendRawTransaction(
        _ transaction: EthereumTransaction,
        withAccount account: EthereumAccountProtocol,
        completion: @escaping ((EthereumClientError?, String?) -> Void))

    func eth_getLogs(
        addresses: [EthereumAddress]?,
        orTopics: [[String]?]?,
        fromBlock: EthereumBlock,
        toBlock: EthereumBlock,
        completion: @escaping((EthereumClientError?, [EthereumLog]?) -> Void))

    func eth_getTransaction(
        byHash txHash: String,
        completion: @escaping((EthereumClientError?, EthereumTransaction?) -> Void))
}

extension EthereumClientService {
    func eth_getLogs(
        addresses: [EthereumAddress]?,
        orTopics: [[String]?]?,
        completion: @escaping((EthereumClientError?, [EthereumLog]?) -> Void)
    ){
        eth_getLogs(
            addresses: addresses,
            orTopics: orTopics,
            fromBlock: .Earliest,
            toBlock: .Latest,
            completion: completion)
    }
}
