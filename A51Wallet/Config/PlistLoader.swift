//
//  A51Wallet
//

import Foundation

struct PlistLoader {
    enum PlistLoaderError: Error {
        case resourceFileNotFound
    }

    static func load<T: Decodable>(_ resourceName: String) throws -> T {
        guard let url = Bundle.main.url(
            forResource: resourceName,
            withExtension: "plist"
        ) else {
            throw PlistLoaderError.resourceFileNotFound
        }

        let data = try Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
