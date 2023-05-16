import SwiftUI

struct setCreator: View {
    @State var term1:String = ""
    @State var definition1:String = ""
    @State var pair:Data = (UserDefaults.standard.data(forKey: "pair") ?? Data([]))
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
            .onSubmit {
                if let data = UserDefaults.standard.data(forKey: "pair") {
                    var pair = try! PropertyListDecoder().decode([pairs].self, from: data)
                    pair.append(pairs(term2: term1, definition2: definition1))
                    
                    
                    
                    if let data = try? PropertyListEncoder().encode(pair) {
                        UserDefaults.standard.set(data, forKey: "pair")
                    }
                }
            }
            Button(action: {
                
                if let data = UserDefaults.standard.data(forKey: "pair") {
                    var pair = try! PropertyListDecoder().decode([pairs].self, from: data)
                    pair.append(pairs(term2: term1, definition2: definition1))
                    print("Here")
                    print("Here")
                    print("Here")
                    print("Here")
                    print(pair)
                    
                    if let data = try? PropertyListEncoder().encode(pair) {
                        UserDefaults.standard.set(data, forKey: "pair")
                    }
                }
            }, label: {
                Image(systemName: "plus.circle")
            })
            
            
        }
        .onAppear(perform: {
            term1 = UserDefaults.standard.string(forKey: "term") ?? ""
            definition1 = UserDefaults.standard.string(forKey: "definition") ?? ""
        })
    }
}
