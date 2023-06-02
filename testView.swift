//
//  testView.swift
//  CurrencyConverter
//
//  Created by James Howard on 4/26/23.
//

import Foundation
import SwiftUI
//
struct testView: View {
    
    @State var term1:String
    @State var enteredTerm: String
    @State var definition1: String
    @State var correctTerm: String
    @State var pair:[pairs] = []
    var body: some View {
        if let data = UserDefaults.standard.value(forKey: "pair") as? Data {
            if var dataDecoded = try? JSONDecoder().decode([pairs].self, from: data){
                VStack{
                  
                    ForEach(dataDecoded,id: \.self){ item in
                        
                        Text(item.definition2)
                    }

                    TextField("What is your term", text: $enteredTerm)
                        .onSubmit {
                            for value in pair{
                                if enteredTerm == value.term2 {
                                    correctTerm = "You got it right"
                                }
                                else{
                                    correctTerm = "You got it wrong, try again"
                                }
                            }
                            
                        }
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    Text(correctTerm)
                }.onAppear(perform: {
                    term1 = UserDefaults.standard.string(forKey: "term") ?? ""
                    definition1 = UserDefaults.standard.string(forKey: "definition") ?? ""
                })
            }
        }
    }
}
