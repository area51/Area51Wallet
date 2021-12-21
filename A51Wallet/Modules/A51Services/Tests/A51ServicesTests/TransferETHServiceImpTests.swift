import XCTest
@testable import A51Services

class TransferETHServiceImpTests: XCTestCase {
    var sut: TransferETHServiceImp?
    var serviceSpy: EthereumClientSpy?

    override func setUp() async throws {
        let serviceSpy = EthereumClientSpy()
        self.serviceSpy = serviceSpy
        sut = TransferETHServiceImp(
            etherClient: serviceSpy,
            privateKey: "")
    }

    override func tearDown() async throws {
        serviceSpy = nil
        sut = nil
    }

    func test_sendRawTransaction_callsEtherClient() throws {
        try XCTSkipIf(true, "Need to mock the account for this test to work")
        let sut = try XCTUnwrap(sut)
        let serviceSpy = try XCTUnwrap(serviceSpy)
        sut.transfer(
            contract: "",
            amount: 0,
            wallet: "",
            to: "") { _ in }
        XCTAssertTrue(true)
        XCTAssertEqual(
            serviceSpy.eth_sendRawTransaction_callCount,
            1)
    }
}
