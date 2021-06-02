
import SwiftUI
import Helper
import SQLSelectDatabase

public struct SecureWWDCBank: View {
    public init() { }
    
    public var body: some View {
        VStack {
            FakeSpacer()
            Image(uiImage: #imageLiteral(resourceName: "wwdcbanklogo.png"))
                .padding()
                .padding()
            
            SecureLoginPage()
            FakeSpacer()
        }
        .background(Color.pageColor)
        .onAppear(perform: {
            print("-> ~ Loading login page")
        })
    }
}

struct SecureLoginPage: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var usernameAttempts: Int = 0
    @State var passwordAttempts: Int = 0
    
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
        print("-> ~ User not found. Incorrect credentials")
        withAnimation(.default) {
            self.usernameAttempts += 1
            self.passwordAttempts += 1
        }
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
