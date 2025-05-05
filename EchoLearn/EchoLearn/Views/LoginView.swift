import SwiftUI
struct LoginView: View {
@StateObject var viewModel = LoginViewViewModel()
    
    
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
                        SecureField("Password", text: $viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle()).autocapitalization(.none).autocorrectionDisabled()
                        
                        ELButton(title: "Log In", backgroundColor: Color.blue) {
                            viewModel.login()
                        }
                        VStack{
                            HStack{
                                
                                Text("New around here?")
                                Spacer()
                            }
                            HStack{
                                NavigationLink("Create an Account",destination: RegisterView())
                                Spacer()
                                
                            }
                        }
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage).foregroundColor(.red)
                        }
                    }}
            }}
                    

                

                
            }
        }
#Preview {
    LoginView()
}
