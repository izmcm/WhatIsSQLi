import SwiftUI

public struct ALL_DataRowView: View {
    public var username: String
    public var password: String
    public var balance: String
    
    public init(username: String, password: String, balance: String) {
        self.username = username
        self.password = password
        self.balance = balance
    }
    
    public var body: some View {
        HStack {
            FakeSpacer()
            CardView(text: username)
                .padding(5)
            CardView(text: password)
                .padding(5)
            CardView(text: balance)
                .padding(5)
            FakeSpacer()
        }
    }
}

public struct USERNAME_DataRowView: View {
    public var username: String
    
    public var body: some View {
        HStack {
            FakeSpacer()
            FakeSpacer()
            CardView(text: username)
                .padding(5)
            FakeSpacer()
            FakeSpacer()
        }
    }
}

public struct PASSWORD_DataRowView: View {
    public var password: String
    
    public var body: some View {
        HStack {
            FakeSpacer()
            FakeSpacer()
            CardView(text: password)
                .padding(5)
            FakeSpacer()
            FakeSpacer()
        }
    }
}

public struct BALANCE_DataRowView: View {
    public var balance: String
    
    public var body: some View {
        HStack {
            FakeSpacer()
            FakeSpacer()
            CardView(text: balance)
                .padding(5)
            FakeSpacer()
            FakeSpacer()
        }
    }
}


