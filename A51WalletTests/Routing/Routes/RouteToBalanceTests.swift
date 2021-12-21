//
//  A51WalletTests
//

import XCTest
import A51Presentation
@testable import A51Wallet

class RouteToBalanceTests: XCTestCase {

    var sut: RouteToBalance?
    var diContainer: DIContainerMock?

    override func setUpWithError() throws {
        sut = RouteToBalance()
        diContainer = DIContainerMock()
        sut?.diContainer = diContainer
    }

    override func tearDownWithError() throws {
        sut = nil
        diContainer = nil
    }

    func test_presentationType_isPush() throws {
        XCTAssertEqual(sut?.presentationType, .push)
    }

    func test_viewControllerToPresent_isOfCorrectType() throws {

        let viewControllerToPresent =
            try XCTUnwrap(sut?.viewControllerToPresent)
        XCTAssertTrue(
            viewControllerToPresent.isKind(
                of: BalanceViewController.self))
    }
}
