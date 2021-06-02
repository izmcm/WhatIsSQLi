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
//: ## Good! Let me see the rows...
//: You have seen **how column selection works** with SQL and now you will learn about **how we select rows**!
//:
//: ⚠️ Using queries like this to retrieve a person's information based on a username and password is extremely common, but many people do it the wrong way 😔
//:
//: See the SQL table that will help us with this problem
//:
//: ## SQL table
//: **username** - **password**
//:
//: * renatafg - 123456
//: * imcm - qwert0
//: * lulu - lulu123
//: * timcook - iloveapple
//: * admin - admin
//:
//: ## Now, help me with a task:
//: ### Using the information we have, can you recover Tim Cook's account?
let username: String = /*#-editable-code username*/""/*#-end-editable-code*/
let password: String = /*#-editable-code password*/""/*#-end-editable-code*/

//: >If you need help, pay attention to the playground tips 

//#-hidden-code
struct ContentView: View {
    var body: some View {
        SQLSelectDatabaseView(column: .all, filterAccountMode: true, username: username, password: password)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//#-end-hidden-code

