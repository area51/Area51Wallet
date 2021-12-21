import web3
import BigInt
import Foundation

public class TransferETHServiceImp: TransferETHService {
    internal let etherClient: EthereumClientService
    internal let privateKey: String

    public init(
        etherClient: EthereumClientService,
        privateKey: String
    ) {
        self.etherClient = etherClient
        self.privateKey = privateKey
    }

    public func transfer(
        contract: String,
        amount: BigUInt,
        wallet: String,
        to recipient: String,
        completion: @escaping (Error?) -> Void
    ){

        guard let account = account,
              let transaction = buildTransaction(
                contract: contract,
                amount: amount,
                wallet: wallet,
                to: recipient
              ) else { return }

        etherClient
            .eth_sendRawTransaction(
                transaction,
                withAccount: account
            ){ (error, _) in
                completion(error)
            }
    }

    private var account: EthereumAccountProtocol? {
        let storage = UnsafeEthereumKeyStorage(privateKey: privateKey)
        do {
            let account = try EthereumAccount(keyStorage: storage)
            return account
        } catch {
            debugPrint("Could not create account with specified private key")
            return nil
        }
    }

    private func buildTransaction(
        contract: String,
        amount: BigUInt,
        wallet: String,
        to recipient: String
    ) -> EthereumTransaction? {

        let gasPrice = BigUInt(12e9)    // 12e9 (gwei)
        let gasLimit = BigUInt(250e3)   // 250.000

        // amount = 0.01e18
        // gas price = 12e9 -> gwei
        // gas limit = 250e3
        // gas fee = 12e9 * 250e3 = 3e15 -> 0.003e18
        // amount + gas = 0.003e18 + 0.01e18 = 0.013e18
        // balance = 1.48e18

        let function = TransferToken(
            contract: EthereumAddress(contract),
            wallet: EthereumAddress(wallet),
            to: EthereumAddress(recipient),
            amount: amount,
            gasPrice: gasPrice,
            gasLimit: gasLimit)

        do {
            return try function.transaction()
        } catch (let error) {
            debugPrint("Failed to create transfer transaction")
            debugPrint(error)
            return nil
        }
    }
}
