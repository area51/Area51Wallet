//
//  A51Wallet
//

import UIKit
import A51Presentation

class RouteToETHTransfer: RouteType {
    weak var router: AppRouter?
    weak var diContainer: DIContainerProtocol?

    var presentationType: RoutePresentationType = .push

    var viewControllerToPresent: UIViewController? {
        guard let config = diContainer?.config,
              let service = diContainer?.ethTransferService else {
            return nil
        }

        let viewModel = ETHTransferViewModel(
            service: service,
            contract: config.contractAddress,
            wallet: config.argentAddress,
            recipient: config.metamaskAddress)

        return ETHTransferViewController(viewModel: viewModel)
    }
}
