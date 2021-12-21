//
//  A51Wallet
//

import UIKit
import A51Presentation
import A51Services

class RouteToERC20TransfersList: RouteType {
    weak var diContainer: DIContainerProtocol?
    weak var router: AppRouter?

    var presentationType: RoutePresentationType = .push

    var viewControllerToPresent: UIViewController? {
        guard let service = diContainer?.erc20TransferService else {
            return nil
        }
        let viewModel = ERC20TransferListViewModel(service: service)
        let viewController =
            ERC20TransferListViewController(viewModel: viewModel)
        return viewController
    }
}
