import SwiftUI

public struct ALL_TitleRowView: View {
    public init() {}
    public var body: some View {
        HStack {
            FakeSpacer()
            CardView(text: "username")
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )   
                .padding(5)
            CardView(text: "password")
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )     
                .padding(5)
            CardView(text: "avaliable\nbalance")
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )   
                .padding(5)
            FakeSpacer()
        }
    }
}

public struct USERNAME_TitleRowView: View {
    public var body: some View {
        HStack {
            FakeSpacer()
            FakeSpacer()
            CardView(text: "username")
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )   
                .padding(5)
            FakeSpacer()
            FakeSpacer()
        }
    }
}

public struct PASSWORD_TitleRowView: View {
    public var body: some View {
        HStack {
            FakeSpacer()
            FakeSpacer()
            CardView(text: "password")
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )   
                .padding(5)
            FakeSpacer()
            FakeSpacer()
        }
    }
}

public struct BALANCE_TitleRowView: View {
    public var body: some View {
        HStack {
            FakeSpacer()
            FakeSpacer()
            CardView(text: "avaliable\nbalance")
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )   
                .padding(5)
            FakeSpacer()
            FakeSpacer()
        }
    }
}
