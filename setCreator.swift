import SwiftUI

struct setCreator: View {
    @State var term1:String = ""
    @State var definition1:String = ""
    @State var pair:[pairs] = []
    var body: some View {
        if let data = UserDefaults.standard.value(forKey: "pair") as? Data {
            if var dataDecoded = try? JSONDecoder().decode([pairs].self, from: data){
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
                        //                if let data = UserDefaults.standard.value(forKey: "pair") as? Data {
                        //                    if let dataDecoded = try? JSONDecoder().decode([pairs].self, from: data){
                        
                        dataDecoded.append(pairs(term2: term1, definition2: definition1))
                        print("Here")
                        print("Here")
                        print("Here")
                        print("Here")
                        print(pair)
                        if dataDecoded != [] {
                            if let data = try? JSONEncoder().encode(dataDecoded) {
                                UserDefaults.standard.set(data, forKey: "pair")
                            } else{
                                print("UH OH FAILED")
                            }
                        } else {
                            print("add something")
                        }
                        //                    }
                        //                }
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                }
            }
        }
    }
}
