import SwiftUI

struct setCreator: View {
    @State var term1:String = ""
    @State var definition1:String = ""
    @State var pair:[pairs] = []
    var body: some View {
        if let data = UserDefaults.standard.value(forKey: "pair") as? Data {
            if var dataDecoded = try? JSONDecoder().decode([pairs].self, from: data){
                HStack{
                    VStack{
                        Text("Terms")
                        
                        List{
                            ForEach(dataDecoded,id: \.self){ item in
                                
                                Text(item.term2)
                            }
                        }
                    }
                        VStack{
                            Text("Definitions")
                            List{
                                ForEach(dataDecoded,id: \.self){ item in
                                    
                                    Text(item.definition2)
                                }
                            }
                    }
                }
                Group{
                    TextField("Enter your term", text: $term1)
                    TextField("Enter the definition for your term",text: $definition1)
                }
                .textFieldStyle(.roundedBorder)
                .padding()
                
                HStack{
                    Button(action: {
                        
                        dataDecoded.append(pairs(term2: term1, definition2: definition1))
                        print("Here")
                        print("Here")
                        print("Here")
                        print("Here")
                        print(dataDecoded)
                        if dataDecoded != [] {
                            if let data = try? JSONEncoder().encode(dataDecoded) {
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
    }
}


