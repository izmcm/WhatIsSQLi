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
        VulnerableWWDCBank()
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//#-end-hidden-code
//:
//: ## Welcome to WWDC21 bank... but wait
//: This system is in the **process of development** and may have some security issues.
//: I told the developers that you were good at finding such problems, so how about repeating what you learned on the previous page?
//:
//: ## For this problem, you must log into the **timcook** user account without knowing the password.
//: ## Let's go!
//:
//:
//: - Important: Be careful with the automatic formatting of quotation marks on your keyboard
//: >If you need help, pay attention to the playground tips and console

