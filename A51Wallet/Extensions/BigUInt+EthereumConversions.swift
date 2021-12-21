//
//  A51Wallet
//

import Foundation
import BigInt

extension BigUInt {
    var weiToGwei: BigUInt {
        self / BigUInt(1e9)
    }
}
