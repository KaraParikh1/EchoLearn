import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


@main
struct EchoLearnApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
