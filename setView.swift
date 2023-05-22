import SwiftUI

struct setView: View {
    
    @State var term1:String
    @State var definition1: String
    var body: some View {
        VStack{
            VStack{ //switch this to Z-stack in order to next card(when its made)
                flipcard(term1: "", definition1: "", flipped: false)
                    .frame(width: 300, height: 200)
            }
            .onAppear(perform: {
                term1 = UserDefaults.standard.string(forKey: "term") ?? ""
                definition1 = UserDefaults.standard.string(forKey: "definition") ?? ""
            })

        }
    }
}
