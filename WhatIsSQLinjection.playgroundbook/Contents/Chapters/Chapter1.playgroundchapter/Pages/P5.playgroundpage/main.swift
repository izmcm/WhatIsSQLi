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

struct ContentView: View {
    var body: some View {
        SecureWWDCBank()
    }
}

PlaygroundPage.current.setLiveView(ContentView())
PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.pass(message: "So, that's all! You can try as much as you want but this page will not be hacked.\n\nI hope you had fun and learned a little more about this big vulnerability that, unfortunately, hits many sites around the world...\n\nSee you later :P")
//#-end-hidden-code
//:
//: ## Welcome to the secure WWDC21 Bank
//: You were right... they had a big problem with SQL injection, but thanks to you everything was solved before the official launch 🥳
//:
//: The developers revised the code and made a change to the way they created an SQL query
//:
//: ----
/*:
 ### Wrong code
 ````
 let SQL_query = """
                    SELECT * FROM accounts
                    WHERE username = '" + username + "'
                    AND password = '" + password + "'"
                 """
 ````
 ### Right code
 ````
 let SQL_query = """
                    SELECT * FROM accounts
                    WHERE username = '\(username)'
                    AND password = '\(password)'"
                 """
 ````
 */
//: ----
//: If you pay attention, they are now using **own language resources** to handle cases of single quotes in the text.
//: **Many modern languages, like Swift, do this automatically for us!**
//: It was really a big security problem extremely easy to solve 😁
//:
//: Now I'm going to get my coffee ☕️ and you can keep trying to hack the new system of WWDC21 bank... if you find any problem, you know where to find me 🔎
//: ## Thank you for coming with me on this journey! See you 👋
//: Special thanks to Josh Pan for the song Guitar House.
//:
//: If you want to learn more about vulnerabilities, [OWASP Foundation](https://owasp.org/) is a good start
