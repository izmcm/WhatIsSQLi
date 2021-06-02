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
//: ## Hey! Nice to meet you 😆
//: Hope you're well! My name is Izabella
//:
//: Well, this playground will teach you a little bit about **how works** and **how to solve** one of today's biggest application vulnerabilities: SQL Injection.
//:
//: ## What is SQL?
//: SQL is a language used to query for specific data in a database
//:
//: ## Before we understand the security risks, let's understand better how it works, okay?
//: ## This page will introduce you to more about getting columns with SQL queries. How?
//: Change the **column variable** to `.all`, `.username`, `.password` or `.avaliableBalance` and run to see the result in our database
//: ### Are you ready? Let's go!
let column: Columns = /*#-editable-code state name*/.all/*#-end-editable-code*/
//#-hidden-code
struct ContentView: View {
    var body: some View {
        SQLSelectDatabaseView(column: column)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.pass(message: "When you have understood better about selecting columns in SQL tables, go to the [next page](@next)! :)")
//#-end-hidden-code
