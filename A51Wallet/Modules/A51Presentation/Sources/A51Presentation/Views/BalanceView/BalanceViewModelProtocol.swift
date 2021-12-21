import Foundation

public typealias FetchAccountBalanceResponse = (Error?) -> Void

public protocol BalanceViewModelProtocol {
    var header: String { get }
    var balance: String { get }

    func fetchAccountBalance(completion: @escaping FetchAccountBalanceResponse)
}
