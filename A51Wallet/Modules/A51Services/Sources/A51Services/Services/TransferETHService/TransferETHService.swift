import Foundation
import BigInt

public protocol TransferETHService {
    func transfer(
        contract: String,
        amount: BigUInt,
        wallet: String,
        to recipient: String,
        completion: @escaping (Error?) -> Void)
}
