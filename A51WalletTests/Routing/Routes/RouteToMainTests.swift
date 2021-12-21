//
//  A51WalletTests
//

import XCTest
import UIKit
import A51Presentation
@testable import A51Wallet

class RouteToMainTests: XCTestCase {
    var sut: RouteToMain?
    var diContainer: DIContainerMock?
    var router: AppRouterSpy?

    override func setUp() async throws {
        let diContainer = DIContainerMock()
        self.diContainer = diContainer
        router = AppRouterSpy(diContainer: diContainer)
        sut = RouteToMain()
        sut?.diContainer = diContainer
        sut?.router = router
    }

    override func tearDown() async throws {
        sut = nil
        diContainer = nil
        router = nil
    }

    func test_presentationType_isPush() throws {
        XCTAssertEqual(
            RouteToMain().presentationType,
            .push)
    }

    func test_viewControllerToPresent_isOfCorrectType() throws {
        let viewControllerToPresent = try XCTUnwrap(sut?.viewControllerToPresent)
        XCTAssertTrue(
            viewControllerToPresent
                .isKind(of: MainViewController.self))
    }

    func test_viewControllerToPresent_containsCorrectChildViewControllers() throws
    {
        let viewControllerToPresent = try XCTUnwrap(sut?.viewControllerToPresent)
        let expectedChildren = [
            String(describing: BalanceViewController.self),
            String(describing: ETHTransferViewController.self),
            String(describing: ViewERC20ViewController.self)
        ]
        let currentChildren = viewControllerToPresent
            .children
            .map { String(describing: type(of: $0)) }
        XCTAssertEqual(expectedChildren, currentChildren)
    }
}
