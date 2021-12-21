//
//  51Wallet
//

import UIKit

protocol RouteType: AnyObject {
    var diContainer: DIContainerProtocol? { get set }
    var router: AppRouter? { get set }

    var presentationType: RoutePresentationType { get }
    var viewControllerToPresent: UIViewController? { get }
}
