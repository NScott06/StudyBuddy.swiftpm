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
    var body: some View {
        VStack{
            Text(definition1)
            TextField("What is your term", text: $enteredTerm)
                .onSubmit {
                    if enteredTerm == term1 {
                        correctTerm = "You got it right"
                    }
                    else{
                        correctTerm = "You got it wrong, try again"
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

