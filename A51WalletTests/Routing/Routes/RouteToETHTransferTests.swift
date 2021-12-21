//
//  A51WalletTests
//

import XCTest
import A51Services
import A51Presentation
@testable import A51Wallet

class RouteToETHTransferTests: XCTestCase {
    var sut: RouteToETHTransfer?
    var diContainer: DIContainerMock?

    override func setUp() async throws {
        diContainer = DIContainerMock()
        sut = RouteToETHTransfer()
        sut?.diContainer = diContainer
    }

    override func tearDown() async throws {
        sut = nil
        diContainer = nil
    }

    func test_presentationType_isPush() throws {
        XCTAssertEqual(sut?.presentationType, .push)
    }

    func test_viewControllerToPresent_isOfCorrectType() throws
    {
        let viewControllerToPresent =
            try XCTUnwrap(sut?.viewControllerToPresent)
        XCTAssertTrue(
            viewControllerToPresent.isKind(
                of: ETHTransferViewController.self))
    }

}
