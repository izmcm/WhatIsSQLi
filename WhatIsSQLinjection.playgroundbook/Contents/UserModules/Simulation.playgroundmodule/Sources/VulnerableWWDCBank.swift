
import SwiftUI
import Helper
import SQLSelectDatabase
import PlaygroundSupport

public struct VulnerableWWDCBank: View {
    @State var validUser: Bool = false
    
    public init() { }
    
    public var body: some View {
        VStack {
            FakeSpacer()
            Image(uiImage: #imageLiteral(resourceName: "wwdcbanklogo.png"))
                .padding()
                .padding()
            
            if validUser {
                VStack {
                    HStack {
                        FakeSpacer()
                        CardView(text: "Available\nBalance")
                        CardView(text: "$$$$")
                        FakeSpacer()
                    }
                    .frame(height: 60)
                    
                    HStack {
                        FakeSpacer()
                        VStack {
                            CardView(text: "Bank Statement")
                                .frame(height: 30)
                            ForEach(0..<10) { _ in
                                Text("outerwear | - $50.00")
                                    .foregroundColor(.white)
                            }
                            Text("...")
                        }
                        FakeSpacer()
                    }
                    
                }
                
            } else {
                LoginPage(validUser: $validUser)
            }
            
            FakeSpacer()
        }
        .background(Color.pageColor)
        .onAppear(perform: {
            print("-> ~ Loading login page")
        })
    }
}

struct LoginPage: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var usernameAttempts: Int = 0
    @State var passwordAttempts: Int = 0
    @Binding var validUser: Bool
    
    var body: some View {
        HStack {
            FakeSpacer()
            VStack {
                TextView("Username", text: $username)
                    .frame(height: 55)
                    .modifier(Shake(animatableData: CGFloat(usernameAttempts)))
                    .padding(.vertical)
                
                TextView("Password", text: $password)
                    .frame(height: 55)
                    .modifier(Shake(animatableData: CGFloat(passwordAttempts)))
                
                Button(action: {
                    print("-> ~ Receiving user credentials")
                    self.validateFields()
                    
                    if self.username != "" && self.password != "" {
                        print("-> ~ Searching for user \(self.username) in the database")
                        self.checkUserIsValid()
                    }
                }) {
                    CardView(text: "Login", 
                             bgColor: Color.mediumOrange)
                        .frame(width: 150, height: 40)
                }
                .padding()
                .padding()
            }
            FakeSpacer()
        }
    }
    
    private func checkUserIsValid() {
        if self.username == "timcook" && self.passwordIsAtrueExpression() {
            print("-> ~ User found!")
            self.validUser = true
            PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.pass(message: "Oh my God! You really did it :D we shouldn't see any of this here, better go to the [next page](@next) soon to learn how to fix this problem")
        } else if self.username.contains("'") || self.password.contains("'") {
            print("-> ~ UNEXPECTED ERROR WHILE QUERYING DATABASE: Invalid command SELECT * FROM accounts WHERE username = '\(self.username)' AND password = '\(self.password)'")
            PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.fail(hints: ["Good :) If you need help, open the console to get a better look at the query we're trying to make"], solution: "In the username field put **timcook** and in the password field try something like **' or '1' = '1**")
        } else {
            print("-> ~ User not found. Incorrect credentials")
            PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.fail(hints: ["Try to put a single quote in the password field and look at the console to see what happens"], solution: "In the username field put **timcook** and in the password field try something like **' or '1' = '1**")
        }
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
    
    private func validateFields() {
        if self.username == "" {
            print("-> ~ Empty username field")
            withAnimation(.default) {
                self.usernameAttempts += 1
            }
        }
        
        if self.password == "" {
            print("-> ~ Empty password field")
            withAnimation(.default) {
                self.passwordAttempts += 1
            }
        }
    }
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
                                                amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                                              y: 0))
    }
}
