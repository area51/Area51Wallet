import web3
import Foundation

class UnsafeEthereumKeyStorage: EthereumKeyStorageProtocol {
    private var privateKey: String

    init(privateKey: String) {
        self.privateKey = privateKey
    }

    func storePrivateKey(key: Data) throws {
    }

    func loadPrivateKey() throws -> Data {
        privateKey.web3.hexData!
    }
}
