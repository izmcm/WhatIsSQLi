//#-hidden-code
import SwiftUI
import PlaygroundSupport
import AVFoundation

var sound: AVAudioPlayer?
if let path = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3") {
    let url = URL(fileURLWithPath: path)
    do {
        sound = try AVAudioPlayer(contentsOf: url)
        sound?.volume = 0.05
        sound?.numberOfLoops = -1
        sound?.play()
    }
    catch { }
}
//#-end-hidden-code
//:
//: ## Oh no! Passwords are gone...
//: but this is a vunerable system!
//:
//: ### Can we recover information without knowing passwords?
//: I belive we can 🤔
//:
//:
//: ---
/*:
 Look at the SQL query and try to make the password comparison **always true**. You can use another magic SQL word for this: **the OR command**.
 
 ````
 SELECT * FROM accounts
 WHERE username = 'username'
 AND password = 'password' OR [true comparison]
 ````
*/
//: ---
//: Also, notice **how single quotes work**, pay attention to close all quotes in the query and try to **compare two identical things**
//:
//: ## Are you ready? So, let's retrieve the **timcook** user information again
let username: String = "timcook"
let password: String = /*#-editable-code password*/""/*#-end-editable-code*/

//: >If you need help, pay attention to the playground tips 
//#-hidden-code
struct ContentView: View {
    var body: some View {
        SQLInjectionDatabaseView(filterAccountMode: true, username: username, password: password)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//#-end-hidden-code
