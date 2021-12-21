//
//  A51WalletTests
//

import XCTest
import A51Services
import A51Presentation
import web3
import BigInt
@testable import A51Wallet

class AppRouterTests: XCTestCase {
    var sut: AppRouter?

    override func setUp() async throws {
        sut = dummyAppRouter()
    }

    override func tearDown() async throws {
        sut = nil
    }

    func test_mainViewController_returned() throws {
        XCTAssertNotNil(sut?.mainViewController)
    }

    func test_mainViewController_isNavController() throws {
        let sut = try XCTUnwrap(sut)
        XCTAssertTrue(sut.mainViewController
                        .isKind(of: UINavigationController.self))
    }

    func test_mainViewController_nav_containsCorrectRootViewController() throws
    {
        let nav: UINavigationController = try XCTUnwrap(
            sut?.mainViewController)
        XCTAssertEqual(nav.viewControllers.count, 1)
        let mainViewController = try XCTUnwrap(nav.viewControllers.first)
        XCTAssertTrue(mainViewController.isKind(of: MainViewController.self))
    }

    func test_routeToSpecifiedRoute() throws {
        let sut = try XCTUnwrap(sut)
        let route = TestRoute()
        let nav = NotAnimatedNavigationController()
        try? sut.route(from: nav, to: route)

        XCTAssertTrue(
            nav.viewControllers
                .contains(route.viewController))
    }
}

// MARK: - Test helpers

class TestViewController: UIViewController {}

class TestRoute: RouteType {
    var router: AppRouter?

    var diContainer: DIContainerProtocol?
    let viewController = TestViewController()

    var presentationType: RoutePresentationType = .push

    var viewControllerToPresent: UIViewController? {
        viewController
    }
}

func dummyAppRouter() -> AppRouter {
    let diContainer = DIContainerMock()
    return AppRouter(diContainer: diContainer)
}
