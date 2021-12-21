//
//  A51Wallet
//

import Foundation
import A51Presentation
import web3

struct TransferInfoAdapter {
    static func ethTransferInfo(from tx: EthereumTransaction) -> TransferInfo? {
        return TransferInfo(
            sender: tx.from?.value ?? "sender",
            token: "0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE",
            amount: String(tx.value ?? 0))
    }
}
