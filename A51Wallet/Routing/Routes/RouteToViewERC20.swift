//
//  A51Wallet
//

import UIKit
import A51Presentation

class RouteToViewERC20: RouteType {
    weak var diContainer: DIContainerProtocol?
    weak var router: AppRouter?

    var presentationType: RoutePresentationType = .push

    var viewControllerToPresent: UIViewController? {
        guard let router = router else { return nil }
        let viewModel = ViewERC20ViewModel(router: router)
        let viewController = ViewERC20ViewController(viewModel: viewModel)
        return viewController
    }
}
