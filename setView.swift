import SwiftUI

struct setView: View {
    @State var term1:String
    @State var definition1: String
    
    var body: some View {
        VStack{
            if let data = UserDefaults.standard.value(forKey: "pair") as? Data {
                if var dataDecoded = try? JSONDecoder().decode([pairs].self, from: data){
                    ScrollView{
                        VStack{ //switch this to Z-stack in order to next card(when its made)
                            
                            flipcard()
                                .frame(width: 300, height: 200)
                            Button {
                                [dataDecoded].next(item: dataDecoded)
                            } label: {
                                Text("WORK")
                            }
                            .offset(y: 200)
                        }
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                    }
                    .onAppear(perform: {
                        term1 = UserDefaults.standard.string(forKey: "term") ?? ""
                        definition1 = UserDefaults.standard.string(forKey: "definition") ?? ""
                    })
                }
            }
        }
    }
}
