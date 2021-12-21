//
//  A51WalletTests
//

import Foundation
import A51Services
@testable import A51Wallet

class DIContainerMock: DIContainerProtocol {
    var config: WalletConfig {
        dummyWalletConfig()
    }

    var ethereumClient: EthereumClientService {
        EthereumClientStub()
    }

    var fetchBalanceService: FetchBalanceService {
        FetchBalanceServiceImp(etherClient: ethereumClient)
    }

    var ethTransferService: TransferETHService {
        TransferETHServiceImp(
            etherClient: ethereumClient,
            privateKey: "")
    }

    var erc20TransferService: FetchERC20TransfersService {
        FetchERC20TransfersServiceImp(
            etherClient: ethereumClient,
            walletAddress: config.argentAddress)
    }
}

// MARK: - Test classes and helpers

extension DIContainerMock {
    func dummyWalletConfig() -> WalletConfig {
        WalletConfig(
            baseURL: "",
            projectID: "",
            argentAddress: "3535353535353535353535353535353535353535",
            metamaskAddress: "3535353535353535353535353535353535353535",
            contractAddress: "3535353535353535353535353535353535353535",
            privateKey: "0x4646464646464646464646464646464646464646464646464646464646464646")
    }
}
