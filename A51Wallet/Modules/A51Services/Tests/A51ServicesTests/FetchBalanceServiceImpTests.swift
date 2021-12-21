import XCTest
import web3
import BigInt
@testable import A51Services

final class FetchBalanceServiceImpTests: XCTestCase {

    func test_completedWithBalance_whenSuccess() throws {

        let serviceSpy = EthereumClientSpy()
        serviceSpy.eth_getBalance_balance = BigUInt()
        let sut = FetchBalanceServiceImp(etherClient: serviceSpy)

        var balance: BigUInt?
        var error: Error?

        let expectation = expectation(description: "Wait")
        sut.fetchBalance(ofAccount: "") { result in
            switch result {
            case .success(let amount):
                balance = amount
            case .failure(let err):
                error = err
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.3, handler: nil)
        XCTAssertEqual(serviceSpy.eth_getBalance_balance, balance)
        XCTAssertNil(error)
    }

    func test_completedWithError_whenFailure() throws {

        let serviceSpy = EthereumClientSpy()
        serviceSpy.eth_getBalance_error = .unexpectedReturnValue
        let sut = FetchBalanceServiceImp(etherClient: serviceSpy)
        var balance: BigUInt?
        var error: Error?

        let expectation = expectation(description: "Wait")
        sut.fetchBalance(ofAccount: "") { result in
            switch result {
            case .success(let amount):
                balance = amount
            case .failure(let err):
                error = err
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.3, handler: nil)
        XCTAssertNil(balance)
        XCTAssertNotNil(error)
    }
}
