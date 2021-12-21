//
//  51Wallet
//

import UIKit
import A51Presentation

class RouteToBalance: RouteType {
    weak var diContainer: DIContainerProtocol?
    weak var router: AppRouter?

    var presentationType: RoutePresentationType = .push

    var viewControllerToPresent: UIViewController? {
        guard let account = diContainer?.config.argentAddress,
              let service = diContainer?.fetchBalanceService else {
            return nil
        }
        let viewModel = BalanceViewModel(service: service, account: account)
        let viewController = BalanceViewController(viewModel: viewModel)
        return viewController
    }
}
