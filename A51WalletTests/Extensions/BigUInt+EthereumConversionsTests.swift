//
//  A51WalletTests
//

import XCTest
import BigInt
@testable import A51Wallet

class BigUIntEthereumConversionsTests: XCTestCase {
    func test_weiToGwei() throws {
        let wei = BigUInt(1e18)
        let gwei = wei.weiToGwei
        XCTAssertEqual(gwei, BigUInt(1e9))
    }
}
