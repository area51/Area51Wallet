//
//  A51Wallet
//

import Foundation
import A51Presentation
import A51Services
import BigInt

class ETHTransferViewModel: ETHTransferViewModelProtocol {
    private var amount = BigUInt(0.01e18)
    var transferService: TransferETHService
    private var contract: String
    private var wallet: String
    private var recipient: String

    init(
        service: TransferETHService,
        contract: String,
        wallet: String,
        recipient: String
    ) {
        self.transferService = service
        self.contract = contract
        self.wallet = wallet
        self.recipient = recipient
    }

    func sendTokenTransfer(completion: @escaping (Error?) -> Void) {
        transferService.transfer(
            contract: contract,
            amount: amount,
            wallet: wallet,
            to: recipient,
            completion: completion)
    }
}
