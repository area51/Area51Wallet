//
//  A51Wallet
//

import Foundation
import A51Presentation

class ViewERC20ViewModel: ViewERC20ViewModelProtocol {

    private weak var router: AppRouter?

    init(router: AppRouter) {
        self.router = router
    }

    func handleDidTapViewERC20() {
        guard let router = router else { return }
        let transferListRoute = RouteToERC20TransfersList()
        try? router.route(to: transferListRoute)
    }
}
