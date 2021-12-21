//
//  A51WalletTests
//

import XCTest
import A51Services
import BigInt
@testable import A51Wallet

class ETHTransferViewModelTests: XCTestCase {

    func test_sendTokenTransfer_callsTransfer_withCorrectParameters() throws {
        let spy = TransferETHServiceSpy()
        let contract = "contract"
        let recipient = "recipient"
        let wallet = "wallet"
        let expectedAmount = BigUInt(0.01e18)

        let sut = ETHTransferViewModel(
            service: spy,
            contract: contract,
            wallet: wallet,
            recipient: recipient)

        sut.sendTokenTransfer() { _ in }

        XCTAssertTrue(spy.transferCalled)
        XCTAssertEqual(spy.transfer_contract, contract)
        XCTAssertEqual(spy.transfer_recipient, recipient)
        XCTAssertEqual(spy.transfer_wallet, wallet)
        XCTAssertEqual(spy.transfer_amount, expectedAmount)
    }

}

class TransferETHServiceSpy: TransferETHService {
    var transfer_contract: String?
    var transfer_amount: BigUInt?
    var transfer_wallet: String?
    var transfer_recipient: String?
    var transferCalled = false

    func transfer(
        contract: String,
        amount: BigUInt,
        wallet: String,
        to recipient: String,
        completion: @escaping (Error?) -> Void
    ){
        transfer_contract = contract
        transfer_amount = amount
        transfer_wallet = wallet
        transfer_recipient = recipient
        transferCalled = true
        completion(nil)
    }
}
