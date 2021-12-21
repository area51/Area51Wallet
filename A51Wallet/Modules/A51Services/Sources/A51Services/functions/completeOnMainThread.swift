import Foundation

public func completeOnMainThread(completion: @escaping () -> Void) {

    guard Thread.isMainThread else {
        DispatchQueue.main.async { completion() }
        return
    }
    completion()
}
