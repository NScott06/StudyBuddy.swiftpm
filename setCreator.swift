import SwiftUI

struct setCreator: View {
    @State var term1:String = ""
    @State var definition1:String = ""
    @State var pair:[pairs] = []
    var body: some View {
        
        VStack{
            Text("Your Terms")
            HStack{
                Text("\(term1)")
                Text("\(definition1)")
            }
            Group{
                TextField("Enter your term", text: $term1)
                TextField("Enter the definition for your term",text: $definition1)
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            
            Button(action: {
                
                
                pair.append(pairs(term2: term1, definition2: definition1))
                print("Here")
                print("Here")
                print("Here")
                print("Here")
                print(pair)
                if pair != [] {
                    if let data = try? JSONEncoder().encode(pair) {
                        UserDefaults.standard.set(data, forKey: "pair")
                    } else{
                        print("UH OH FAILED")
                    }
                } else {
                    print("add something")
                }
            }, label: {
                Image(systemName: "plus.circle")
            })
            
            
        }
    }
}
