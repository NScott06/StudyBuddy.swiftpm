import SwiftUI

struct setView: View {
    @State var term1:String
    @State var definition1: String
    var body: some View {
        VStack{
            
            
            
            ZStack{ //switch this to Z-stack in order to next card(when its made)
                
                flipcard()
                    .frame(width: 300, height: 200)
                Button {
                    if let data = UserDefaults.standard.value(forKey: "pair") as? Data {
                        if var dataDecoded = try? JSONDecoder().decode([pairs].self, from: data){
                            @State var thing = dataDecoded
                            thing.append(pairs(term2: "", definition2: ""))
                            thing.index(0, offsetBy: 1) //this one is flawed, everything else works i think, might have to do it where we display terms on the card
                            thing.removeLast()
                        }
                    }
                } label: {
                    Text("WORK")
                }
                .offset(y: 200)
                
                
            }
            .onAppear(perform: {
                term1 = UserDefaults.standard.string(forKey: "term") ?? ""
                definition1 = UserDefaults.standard.string(forKey: "definition") ?? ""
            })
        }
    }
}
