
import SwiftUI
import PlaygroundSupport
import Helper

public enum Columns {
    case all
    case username
    case password
    case avaliableBalance
}

public struct SQLSelectDatabaseView: View {
    var database = [Row(username: "renatafg", 
                        password: "123456"),
                    Row(username: "imcm", 
                        password: "qwert0"),
                    Row(username: "lulu",
                        password: "lulu123"),
                    Row(username: "admin", 
                        password: "admin"),
                    Row(username: "timcook", 
                        password: "iloveapple")]
    
    public var column: Columns
    public var filterAccountMode: Bool
    public var username: String
    public var password: String
    
    public init(column: Columns, filterAccountMode: Bool = false, username: String = "", password: String = "") { 
        self.column = column
        self.filterAccountMode = filterAccountMode
        self.username = username
        self.password = password
        
        if filterAccountMode {
            self.database = filterAccount()
        }
    }
    
    public var body: some View {
        ZStack {
            Color.pageColor
            VStack(alignment: .center) {
                FakeSpacer()
                
                switch self.column {
                case .all:
                    SQLCommand(column: "*", 
                               filterAccountMode: self.filterAccountMode,
                               username: self.username,
                               password: self.password)
                    
                    if database.isEmpty {
                        HStack {
                            FakeSpacer()
                            CardView(text: "No account found")
                            FakeSpacer()
                        }
                    } else {
                        ALL_TitleRowView()
                        
                        ForEach(database, id: \.id){ row in
                            ALL_DataRowView(username: row.username,
                                            password: row.password,
                                            balance: row.balance)
                        } 
                    }
                    
                case .username:
                    SQLCommand(column: "username")
                    
                    USERNAME_TitleRowView()
                    ForEach(database, id: \.id){ row in
                        USERNAME_DataRowView(username: row.username)
                    } 
                case .password:
                    SQLCommand(column: "password")
                    
                    PASSWORD_TitleRowView()
                    ForEach(database, id: \.id){ row in
                        PASSWORD_DataRowView(password: row.password)
                    }
                case .avaliableBalance:
                    SQLCommand(column: "avaliable_balance")
                    
                    BALANCE_TitleRowView()
                    ForEach(database, id: \.id){ row in
                        BALANCE_DataRowView(balance: row.balance)
                    } 
                }
                
                ForEach(0..<(6 - self.database.count)) {_ in 
                    FakeSpacer()
                }
            }
        }
    }
    
    private func filterAccount() -> [Row] {
        for row in self.database {
            if row.username == self.username && self.password == row.password {
                if row.username == "timcook" {
                    PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.pass(message: "Congratulations! :D You just ran an SQL query to retrieve a user based on their username and password! Go to the [next page](@next) to better understand the **risks** involved in this")
                } else {
                    PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.fail(hints: ["Nice! Now you can do the same with Tim Cook to complete this page", "You can check the Tim Cook's username and password to fill in the variables"], solution: "let username: String = \"timcook\"\n\nlet password: String = \"iloveapple\"")
                }
                return [row]
            }
        }
        PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.fail(hints: ["Oh no... It looks like there's no one around here with this username and password. How about taking a better look at the table we passed and trying again?", "You can check the Tim Cook's username and password to fill in the variables"], solution: "let username: String = \"timcook\"\n\nlet password: String = \"iloveapple\"")
        return []
    }
}

private struct SQLCommand: View {
    var column: String
    var filterAccountMode: Bool = false
    var username: String = ""
    var password: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            VStack { 
                Spacer()
                Text("SELECT \(column) FROM accounts")
                    .font(.title)
                    .foregroundColor(Color.cardBg)
                
                if self.filterAccountMode {
                    Text("WHERE username = '\(self.username)' \nAND password = '\(self.password)'")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.title)
                        .foregroundColor(Color.cardBg)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
        }
        .padding()
    }
}

public struct CardView: View {
    public var text: String 
    public var bgColor: Color
    
    public init(text: String, bgColor: Color = Color.cardBg) {
        self.text = text
        self.bgColor = bgColor
    }
    
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(bgColor)
                .cornerRadius(10)
            Text(text)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}

public struct FakeSpacer: View {
    public init() {}
    public var body: some View {
        Rectangle()
            .fill(Color.pageColor)
    }
}
