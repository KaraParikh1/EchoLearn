import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    init() {}
    func register() {
        print("register")
        guard validate() else {
            print("stoppedatvalidate")
            return }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                print("stoppedatvalidate")
                return
            }
            print("gottoend")
            self?.insertUserRecord(id: userId)
        }
    }
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    private func validate() -> Bool{
        guard
            !name.trimmingCharacters(in: .whitespaces).isEmpty,
            !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            print("Didn't pass validate (whitespace)")
            return false
        }
        guard
            email.contains("@") && email.contains(".") else{
            print("Didn't pass validate (email doesn't have required contents)")
            return false
        }
        guard password.count >= 6 else{
            print("Didn't pass validate (password too short)")
            return false
        }
            return true
    }
}
