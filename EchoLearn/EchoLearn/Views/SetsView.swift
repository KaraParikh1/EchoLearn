import SwiftUI
import FirebaseFirestore

struct SetsView: View {
    @StateObject var viewModel = SetsViewViewModel()
    
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack{
                
            }
            .navigationTitle(Text("Sets"))
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.showingNewItemView){
                UploadSetView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
        
    
}

struct SetsView_Previews: PreviewProvider {
    static var previews: some View {
        SetsView(userId: "")
    }
}
