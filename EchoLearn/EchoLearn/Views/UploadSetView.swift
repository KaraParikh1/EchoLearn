import SwiftUI

struct UploadSetView: View {
    @StateObject var viewModel = UploadSetViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Set").font(.system(size: 32)).bold()
            Form {
                TextField("Set Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                Button{
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false}
                    else{
                        viewModel.showAlert = true
                    }
                }
                    label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
                            Text("Create Set").foregroundColor(.white)
                        }.padding()
                    }
                }
        }.alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("error"), message: Text("Please fill in all fields"))
        }
        }
    }

struct UploadSetView_Previews: PreviewProvider {
    static var previews: some View {
        UploadSetView(newItemPresented: Binding(get:{
            return true
        }, set: { _ in}))
    }
}
