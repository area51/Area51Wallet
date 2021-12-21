//
//  A51Wallet
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appRouter: AppRouter!
    var diContainer: DIContainer!

    typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: LaunchOptions?) -> Bool {

        window = UIWindow()
        initializeDependencies()
        window?.rootViewController = appRouter?.mainViewController
        window?.makeKeyAndVisible()
        return true
    }

    private func initializeDependencies() {
        diContainer = DIContainer()
        appRouter = AppRouter(diContainer: diContainer)
    }
}
