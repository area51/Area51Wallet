import Foundation
import web3
import BigInt

public class FetchBalanceServiceImp: FetchBalanceService {
    internal let etherClient: EthereumClientService

    public init(etherClient: EthereumClientService) {
        self.etherClient = etherClient
    }

    public func fetchBalance(
        ofAccount account: String,
        completion: @escaping (Result<BigUInt, Error>) -> Void) {

        let address = EthereumAddress(account)
        etherClient.eth_getBalance(
            address: address,
            block: .Latest) { error, balance in
                completeOnMainThread() {
                    if let error = error {
                        return completion(.failure(error))
                    }
                    if let balance = balance {
                        return completion(.success(balance))
                    }
                }
            }
    }
}
