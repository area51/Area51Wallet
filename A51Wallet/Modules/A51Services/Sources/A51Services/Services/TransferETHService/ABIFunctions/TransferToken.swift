import web3
import BigInt
import Foundation

struct TransferToken: ABIFunction {
    static let name = "transferToken"
    let contract: EthereumAddress
    let from: EthereumAddress? = nil

    let wallet: EthereumAddress
    let token = EthereumAddress("0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE")
    let to: EthereumAddress
    let amount: BigUInt
    let data: Data = Data()

    let gasPrice: BigUInt?
    let gasLimit: BigUInt?

    func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(wallet)
        try encoder.encode(token)
        try encoder.encode(to)
        try encoder.encode(amount)
        try encoder.encode(data)
    }
}
