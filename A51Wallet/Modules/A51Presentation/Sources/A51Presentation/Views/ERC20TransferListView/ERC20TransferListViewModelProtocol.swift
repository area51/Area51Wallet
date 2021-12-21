import Foundation

public typealias FetchERC20TransfersResult = (Result<[TransferInfo], Error>) -> Void

public protocol ERC20TransferListViewModelProtocol {
    var title: String? { get }
    var transfers: [TransferInfo] { get }
    func fetchTransfers(completion: @escaping FetchERC20TransfersResult)
}
