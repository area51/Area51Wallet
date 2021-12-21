//
//  51Wallet
//

import UIKit

class AppRouter {
    weak var diContainer: DIContainerProtocol?
    private lazy var navigationController = UINavigationController()

    init(diContainer: DIContainerProtocol) {
        self.diContainer = diContainer
    }

    var mainViewController: UINavigationController {
        do {
            let routeToMain = RouteToMain()
            routeToMain.diContainer = diContainer
            try route(from: navigationController, to: routeToMain)
        } catch (let error) {
            debugPrint(error)
            // Maybe here have an error view to show to the user
        }
        return navigationController
    }

    func route(from vc: UIViewController? = nil, to route: RouteType) throws {
        let fromViewController = vc ?? navigationController
        guard route.presentationType == .push else {
            throw RoutingError.unsupported
        }
        guard let nav = (fromViewController as? UINavigationController) ?? fromViewController.navigationController else {
            throw RoutingError.navigationControllerNotFound
        }
        route.diContainer = diContainer
        route.router = self
        push(from: nav, to: route)
    }

    private func push(from nav: UINavigationController, to route: RouteType) {
        guard let viewController = route.viewControllerToPresent else {
            debugPrint("Nothing to show for \(route.self), viewToPresent is nil")
            return
        }
        nav.pushViewController(viewController, animated: true)
    }
}
