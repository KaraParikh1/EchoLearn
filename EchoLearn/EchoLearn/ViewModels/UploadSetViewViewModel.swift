import Foundation
import FirebaseAuth
import FirebaseFirestore

class UploadSetViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var showAlert = false
    @Published var terms : [CardItem] = [CardItem(term: "" , definition: ""),CardItem(term: "" , definition: ""),CardItem(term: "" , definition: "")]
    @Published var i: Int = 5
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
        let db = Firestore.firestore()
        let setRef = db.collection("users").document(uId)
            .collection("sets").document(title).collection("flashcards")
        for i in 0..<terms.count {
            let newItem = FlashCardItem(id: newId, title: title, term: terms[i].term, definition: terms[i].definition)
            //Save model
            setRef.addDocument(data: newItem.asDictionary()) { error in
                if let error = error {
                    print("Error adding flashcard: \(error)")
                } else {
                    print("Flashcard added!")
                }
            }
        }

    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
}
