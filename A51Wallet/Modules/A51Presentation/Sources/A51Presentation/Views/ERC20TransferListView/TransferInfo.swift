import Foundation

public struct TransferInfo {
    public let sender: String
    public let token: String
    public let amount: String

    public init(sender: String, token: String, amount: String) {
        self.sender = "From: \(sender)"
        self.token = "Token: \(token)"
        self.amount = "Amount: \(amount)"
    }
}
