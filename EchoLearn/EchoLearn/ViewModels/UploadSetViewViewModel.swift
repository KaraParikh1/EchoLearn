import Foundation
import FirebaseAuth
import FirebaseFirestore

class UploadSetViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var showAlert = false
    init(){}
    
    func save(){
        guard canSave else{
            return
        }
        //Get current user ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        //Create model
        let newId = UUID().uuidString
        let newItem = FlashCardItem(id: newId, title: title)
        //Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("sets")
            .document("newId")
            .setData(newItem.asDictionary())

    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
}
