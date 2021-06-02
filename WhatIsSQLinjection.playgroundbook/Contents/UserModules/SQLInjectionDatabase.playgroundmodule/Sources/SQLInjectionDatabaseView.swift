

import SwiftUI
import PlaygroundSupport
import Helper
import SQLSelectDatabase

public struct SQLInjectionDatabaseView: View {
    var database = [Row(username: "renatafg", 
                        password: "*********"),
                    Row(username: "imcm", 
                        password: "*********"),
                    Row(username: "lulu",
                        password: "*********"),
                    Row(username: "admin", 
                        password: "*********"),
                    Row(username: "timcook", 
                        password: "*********")]
    
    public var filterAccountMode: Bool
    public var username: String
    public var password: String
    
    public init(filterAccountMode: Bool = false, username: String = "", password: String = "") { 
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
                    
                ForEach(0..<(6 - self.database.count)) {_ in 
                    FakeSpacer()
                }
            }
        }
    }
    
    private func filterAccount() -> [Row] {
        for row in self.database {
            if row.username == self.username && self.passwordIsAtrueExpression() {
                PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.pass(message: "Wow! You are good at it :) How about trying again in a more real simulation on the [next page](@next)?")
                return [row]
            }
        }
        PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.fail(hints: ["Hm... Have you tried to close the password quotes?", "Maybe you can also use the OR to create another condition that will always be true"], solution: "let username: String = \"timcook\"\n\nlet password: String = \"' OR '1' = '1\"")
        return []
    }
    
    private func passwordIsAtrueExpression() -> Bool {
        let passwordCheck = "\(self.password)'".lowercased().replacingOccurrences(of: "’", with: "'").replacingOccurrences(of: "‘", with: "'")
        
        if passwordCheck.contains("or") {
            var components = passwordCheck.components(separatedBy: [" ", "="])
            
            var newComp: [String] = []
            for comp in components {
                newComp += comp.components(separatedBy: "or")
            }
            newComp.removeAll(where: { $0 == "" })
            
            if newComp.count >= 3 {
                if newComp[0].last == "'" && !newComp[0].dropLast().contains("'") && newComp[1].first == "'" && newComp[1].last == "'" && newComp[2].first == "'" && newComp[2].last == "'" && newComp[1] == newComp[2] {
                    return true
                }
            }
        }
        
        return false
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

