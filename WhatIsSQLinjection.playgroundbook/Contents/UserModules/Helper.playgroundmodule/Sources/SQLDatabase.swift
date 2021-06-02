
import Foundation

public struct Row {
    public let id = UUID()
    public let username: String
    public let password: String
    public let balance: String = "$\(Int.random(in: 0..<100)).\(Int.random(in: 0..<9))\(Int.random(in: 0..<9))"
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
