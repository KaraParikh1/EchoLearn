import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


@main
struct EchoLearnApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
