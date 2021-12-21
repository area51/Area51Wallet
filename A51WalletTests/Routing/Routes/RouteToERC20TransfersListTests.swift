//
//  A51WalletTests
//

import XCTest
import A51Presentation
@testable import A51Wallet

class RouteToERC20TransfersListTests: XCTestCase {
    var sut: RouteToERC20TransfersList?
    var diContainer: DIContainerMock?

    override func setUpWithError() throws {
        diContainer = DIContainerMock()
        sut = RouteToERC20TransfersList()
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
                of: ERC20TransferListViewController.self))
    }
}
