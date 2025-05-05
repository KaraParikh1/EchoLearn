import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //signed in
            SetsView()
        }else{
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
