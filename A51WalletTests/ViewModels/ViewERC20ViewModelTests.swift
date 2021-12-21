//
//  A51WalletTests
//

import XCTest
@testable import A51Wallet

class ViewERC20ViewModelTests: XCTestCase {

    func test_handleDidTapViewERC20_callsRouter() throws {
        let spy = AppRouterSpy(
            diContainer: DIContainerMock())
        let sut = ViewERC20ViewModel(router: spy)

        sut.handleDidTapViewERC20()
        XCTAssertTrue(spy.route_called)
    }
}
