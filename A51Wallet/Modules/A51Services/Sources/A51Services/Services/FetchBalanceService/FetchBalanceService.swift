import Foundation
import BigInt

public protocol FetchBalanceService {
    func fetchBalance(
        ofAccount account: String,
        completion: @escaping (Result<BigUInt, Error>) -> Void) 
}
