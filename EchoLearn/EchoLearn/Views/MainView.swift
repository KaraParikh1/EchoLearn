import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            AccountView
        }
        
        else{
            LoginView()
        }
    }
    @ViewBuilder
    var AccountView: some View {
        TabView{
            SetsView(userId: viewModel.currentUserId).tabItem {
                Label("Home",systemImage: "house")}
            ProfileView().tabItem {
                Label("Profile",systemImage: "person.circle")
                
            }}
    }
}
    #Preview {
        MainView()
    }
