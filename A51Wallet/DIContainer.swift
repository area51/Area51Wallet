//
//  A51Wallet
//

import Foundation
import A51Services
import web3

protocol DIContainerProtocol: AnyObject {
    var config: WalletConfig { get }
    var ethereumClient: EthereumClientService { get }
    var fetchBalanceService: FetchBalanceService { get }
    var ethTransferService: TransferETHService { get }
    var erc20TransferService: FetchERC20TransfersService { get }
}

class DIContainer: DIContainerProtocol {
    var ethereumClient: EthereumClientService
    private(set) var config: WalletConfig

    init() {
        config = WalletConfig()
        guard let clientURL = config.clientURL else {
            preconditionFailure("Missing ethereum client.")
        }
        ethereumClient = EthereumClient(url: clientURL)
    }

    var fetchBalanceService: FetchBalanceService {
        FetchBalanceServiceImp(etherClient: ethereumClient)
    }

    var ethTransferService: TransferETHService {
        TransferETHServiceImp(
            etherClient: ethereumClient,
            privateKey: config.privateKey)
    }

    var erc20TransferService: FetchERC20TransfersService {
        FetchERC20TransfersServiceImp(
            etherClient: ethereumClient,
            walletAddress: config.argentAddress)
    }
}
