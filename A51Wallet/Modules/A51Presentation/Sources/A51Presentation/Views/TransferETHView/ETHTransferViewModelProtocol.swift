import Foundation

public protocol ETHTransferViewModelProtocol {
    func sendTokenTransfer(completion: @escaping (Error?) -> Void)
}
