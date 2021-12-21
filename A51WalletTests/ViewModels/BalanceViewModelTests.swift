//
//  A51WalletTests
//

import XCTest
import A51Services
import BigInt
@testable import A51Wallet

class BalanceViewModelTests: XCTestCase {
    var sut: BalanceViewModel?
    var spy: FetchAccountBalanceSpy?

    override func setUpWithError() throws {
        let spy = FetchAccountBalanceSpy()
        self.spy = spy
        sut = BalanceViewModel(
            service: spy,
            account: "xAx")
    }

    override func tearDownWithError() throws {
        sut = nil
        spy = nil
    }

    func test_returns_defaultHeader() throws {
        XCTAssertEqual(sut?.header, "Wallet Balance")
    }

    func test_whenBalanceIsNotLoaded_returns_defaultBalance() throws {
        XCTAssertEqual(sut?.balance, "Loading...")
    }

    func test_whenBalanceIsLoaded_balanceIsCorrectlyFormatted() throws {
        let etherClient = EthereumClientStub()
        etherClient.eth_getBalance_balance = BigUInt(5.12345e18)
        let service = FetchBalanceServiceImp(
            etherClient: etherClient)
        let sut = BalanceViewModel(
            service: service,
            account: "xAx")
        sut.fetchAccountBalance { _ in }
        XCTAssertEqual(sut.balance, "5.12 ETH")
    }

    func test_fetchAccountBalance_calledWithCorrectAccount() throws {
        sut?.fetchAccountBalance { _ in }
        XCTAssertEqual(spy?.accountToFetch, "xAx")
    }

    func test_fetchAccountBalance_callsCompletionBlock() throws {
        let etherClient = EthereumClientStub()
        etherClient.eth_getBalance_balance = BigUInt(integerLiteral: 10)
        let service = FetchBalanceServiceImp(
            etherClient: etherClient)
        let sut = BalanceViewModel(
            service: service,
            account: "xAx")

        var completionBlockCallCount: Int = 0
        sut.fetchAccountBalance { _ in
            completionBlockCallCount += 1
        }
        XCTAssertEqual(completionBlockCallCount, 1)
    }
}

class FetchAccountBalanceSpy: FetchBalanceService {

    var accountToFetch: String?

    func fetchBalance(
        ofAccount account: String,
        completion: @escaping (Result<BigUInt, Error>) -> Void) {

        accountToFetch = account
    }
}
