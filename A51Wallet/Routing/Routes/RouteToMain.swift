//
//  A51Wallet
//

import UIKit
import A51Presentation

class RouteToMain: RouteType {
    weak var diContainer: DIContainerProtocol?
    weak var router: AppRouter?

    var presentationType: RoutePresentationType = .push

    var viewControllerToPresent: UIViewController? {
        let mainViewController = MainViewController()
        let routes: [RouteType] = [
            RouteToBalance(),
            RouteToETHTransfer(),
            RouteToViewERC20()
        ]
        let childViewControllers: [UIViewController] = routes.compactMap { route in
            route.diContainer = diContainer
            route.router = router
            return route.viewControllerToPresent
        }

        mainViewController
            .addChildViewControllersToStackView(childViewControllers)
        return mainViewController
    }
}

