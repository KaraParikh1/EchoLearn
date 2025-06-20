import SwiftUI
import FirebaseFirestore

struct SetsView: View {
    @StateObject var viewModel = SetsViewViewModel()
    @FirestoreQuery var sets: [FlashCardItem]
    
    init(userId: String){
        self._sets = FirestoreQuery(collectionPath: "users/\(userId)/sets")
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(sets) { set in
                    Text(set.title)
                }.listStyle(PlainListStyle())
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
