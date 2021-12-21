//
//  A51WalletTests
//

import UIKit

class NotAnimatedNavigationController: UINavigationController {

    override
    func pushViewController(
        _ viewController: UIViewController,
        animated: Bool
    ){
        super.pushViewController(viewController, animated: false)
    }
}
