import SwiftUI

struct ELButton: View {
    let title: String
    let backgroundColor: Color
    let action: () ->  Void
    var body: some View {
        Button{
            print("button pressed")
            //Attempt Login
        }label:{
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(backgroundColor)
                Text(title).foregroundColor(Color.white).bold()
            }}
    }
}

#Preview {
    ELButton(title: "value",backgroundColor: Color.red){
        
    }
}
