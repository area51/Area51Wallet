//
//  A51Wallet
//

import Foundation

struct WalletConfig: Decodable {
    private enum CodingKeys: String, CodingKey {
        case baseURL
        case projectID
        case argentAddress
        case metamaskAddress
        case contractAddress
        case privateKey
    }

    let baseURL: String
    let projectID: String
    let argentAddress: String
    let metamaskAddress: String
    let contractAddress: String
    let privateKey: String

    init(baseURL: String,
         projectID: String,
         argentAddress: String,
         metamaskAddress: String,
         contractAddress: String,
         privateKey: String
    ) {

        self.baseURL = baseURL
        self.projectID = projectID
        self.argentAddress = argentAddress
        self.metamaskAddress = metamaskAddress
        self.contractAddress = contractAddress
        self.privateKey = privateKey
    }

    var clientURL: URL? {
        URL(string: "\(baseURL)/\(projectID)")
    }

    init() {
        var config: WalletConfig
        let configFileName = "EthereumClientConfig"
        do {
            config = try PlistLoader.load(configFileName)
        } catch {
            preconditionFailure("Error: \(configFileName) not found.")
        }

        baseURL = config.baseURL
        projectID = config.projectID
        argentAddress = config.argentAddress
        metamaskAddress = config.metamaskAddress
        contractAddress = config.contractAddress
        privateKey = config.privateKey
    }
}
