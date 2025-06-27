import SwiftUI

struct UploadSetView: View {
    @StateObject var viewModel = UploadSetViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Set").font(.system(size: 32)).bold()
            Form {
                HStack{
                    TextField("Set Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                    
                }
                ScrollView(.vertical){
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach($viewModel.terms) { $term in
                            HStack{
                                Spacer()
                                TextField("Term", text: $term.term)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(4)
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                TextField("Definition", text: $term.definition)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(4)
                                Spacer()
                            }
                        }
                        Button{
                            viewModel.terms.append(CardItem(term:"", definition:""))
                        }
                        label:{
                            HStack{
                                Spacer()
                                Image(systemName: "plus").foregroundColor(.black).font(.system(size: 30))
                                Spacer()
                            }
                        }
                    }}
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
                }.alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("error"), message: Text("Please fill in all fields"))
                }
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

