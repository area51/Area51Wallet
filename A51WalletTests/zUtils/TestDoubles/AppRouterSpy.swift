//
//  A51WalletTests
//

import UIKit
@testable import A51Wallet

class AppRouterSpy: AppRouter {
    var route_called = false
    var route_fromViewController: UIViewController?
    var route_toRoute: RouteType?

    override
    func route(
        from vc: UIViewController? = nil,
        to route: RouteType) throws
    {
        route_fromViewController = vc
        route_toRoute = route
        route_called = true
    }
}
