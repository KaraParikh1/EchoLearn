import SwiftUI
struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("background").resizable().ignoresSafeArea().scaledToFill()
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Image("LogoPic&Word")
                    Spacer()
                    Form{
                        TextField("Email Adress", text: $viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle()).autocapitalization(.none).autocorrectionDisabled()
                        TextField("Name", text: $viewModel.name).textFieldStyle(RoundedBorderTextFieldStyle()).autocapitalization(.none).autocorrectionDisabled()
                        SecureField("Password", text: $viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle()).autocapitalization(.none).autocorrectionDisabled()
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
                            HStack{
                                Spacer()
                                
                                Button{
                                    viewModel.register()
                                    print(viewModel.email,viewModel.name,viewModel.password)
                                }label:{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
                                        VStack{
                                            Spacer()
                                            Text("Create Account").foregroundColor(Color.white).bold()
                                            Spacer()
                                        }}
                                    Spacer()
                                }}
                            
                        }
                    }.padding()
                }
                
            }
        }
    }
}
#Preview {
    RegisterView()
}
